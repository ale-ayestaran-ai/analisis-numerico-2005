import numpy as np
from .base import Model, ParamDef


def _f(t, y, r=1.0, K=200.0, q=1.0, C=0.01, D=0.5, g_conv=0.1,
       h_handling=0.5, response_type="Type I", **kw):
    """Predator-prey with functional responses:

    Prey:     dn/dt = r*n*(1-(n/K)^q) - functional_response * p
    Predator: dp/dt = g*p*(functional_response_per_prey - D)

    Type I (linear):    FR = C*n
    Type II (Holling):  FR = C*n / (1 + C*h*n)
    Type III (sigmoidal): FR = C*n^2 / (1 + C*h*n^2)
    """
    n, p = y[0], y[1]
    n = max(n, 0)  # Prevent negative populations in intermediate steps

    if response_type == "Type I":
        fr = C * n
    elif response_type == "Type II":
        fr = C * n / (1 + C * h_handling * n)
    else:  # Type III
        fr = C * n**2 / (1 + C * h_handling * n**2)

    dn = r * n * (1 - (n / K)**q) - fr * p
    dp = g_conv * p * (fr - D)
    return np.array([dn, dp])


def _jacobian(t, y, r=1.0, K=200.0, q=1.0, C=0.01, D=0.5, g_conv=0.1,
              h_handling=0.5, response_type="Type I", **kw):
    n, p = max(y[0], 1e-12), y[1]

    if response_type == "Type I":
        fr = C * n
        dfr_dn = C
    elif response_type == "Type II":
        denom = 1 + C * h_handling * n
        fr = C * n / denom
        dfr_dn = C / denom**2
    else:  # Type III
        denom = 1 + C * h_handling * n**2
        fr = C * n**2 / denom
        dfr_dn = 2 * C * n / denom**2

    dn_dn = r * (1 - (n / K)**q) - r * n * q * (n / K)**(q - 1) / K - dfr_dn * p
    dn_dp = -fr
    dp_dn = g_conv * p * dfr_dn
    dp_dp = g_conv * (fr - D)

    return np.array([[dn_dn, dn_dp], [dp_dn, dp_dp]])


def _nullclines(params, n_range):
    """Nullclines from the original Matlab code (din2predlok.m lines 978-1000)."""
    r = params["r"]
    K = params["K"]
    q = params["q"]
    C = params["C"]
    D = params["D"]
    h_handling = params["h_handling"]
    response_type = params["response_type"]

    n_vals = np.linspace(0.01, max(n_range) if hasattr(n_range, '__len__') else n_range, 300)

    # Predator nullcline: dp/dt = 0 -> FR = D -> vertical line at critical N
    if response_type == "Type I":
        n_star = D / C if C != 0 else 0
    elif response_type == "Type II":
        n_star = D / (C * (1 - h_handling * D)) if C * (1 - h_handling * D) != 0 else 0
    else:  # Type III
        val = D / (C * (1 - h_handling * D)) if C * (1 - h_handling * D) != 0 else 0
        n_star = np.sqrt(max(val, 0))

    # Prey nullcline: dn/dt = 0 -> p = r*n*(1-(n/K)^q) / FR
    if response_type == "Type I":
        # p = -((n/K)^q - 1) * r / C
        p_null = -((n_vals / K)**q - 1) * r / C if C != 0 else np.zeros_like(n_vals)
    elif response_type == "Type II":
        # p = -((n/K)^q - 1) * r/C * (C*h*n + 1)
        p_null = -((n_vals / K)**q - 1) * r / C * (C * h_handling * n_vals + 1) if C != 0 else np.zeros_like(n_vals)
    else:  # Type III
        # p = -((n/K)^q - 1) * r/(C*n) * (C*h*n^2 + 1)
        with np.errstate(divide='ignore', invalid='ignore'):
            p_null = -((n_vals / K)**q - 1) * r / (C * n_vals) * (C * h_handling * n_vals**2 + 1)
            p_null = np.where(np.isfinite(p_null), p_null, 0)

    return {
        "pred_nullcline": {
            "type": "vertical",
            "value": n_star,
            "label": "Predator nullcline (dP/dt=0)",
        },
        "prey_nullcline": {
            "type": "curve",
            "x": n_vals, "y": p_null,
            "label": "Prey nullcline (dN/dt=0)",
        },
    }


functional_response_model = Model(
    name="Predator-Prey + Functional Response",
    n_dims=2,
    var_names=["Prey (N)", "Predator (P)"],
    param_defs={
        "r": ParamDef(default=1.0, min=0.01, max=5.0, step=0.1, label="Prey growth rate (r)"),
        "K": ParamDef(default=200.0, min=10.0, max=1000.0, step=10.0, label="Carrying capacity (K)"),
        "q": ParamDef(default=1.0, min=0.1, max=5.0, step=0.1, label="Growth exponent (q)"),
        "C": ParamDef(default=0.01, min=0.001, max=0.1, step=0.001, label="Capture rate (C)"),
        "D": ParamDef(default=0.5, min=0.01, max=5.0, step=0.1, label="Predator death rate (D)"),
        "g_conv": ParamDef(default=0.1, min=0.01, max=1.0, step=0.01, label="Conversion efficiency (g)"),
        "h_handling": ParamDef(default=0.5, min=0.0, max=10.0, step=0.1, label="Handling time (h)"),
    },
    f=_f,
    jacobian=_jacobian,
    nullcline_funcs=_nullclines,
    extra_widgets={"response_type": {"type": "selectbox", "options": ["Type I", "Type II", "Type III"], "label": "Functional Response Type"}},
)
