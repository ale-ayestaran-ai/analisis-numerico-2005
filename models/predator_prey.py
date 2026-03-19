import numpy as np
from .base import Model, ParamDef


def _f(t, y, r=1.0, C=0.01, d=0.5, g_conv=0.1, **kw):
    """Simple predator-prey (Lotka-Volterra predation):
    dn/dt = r*n - C*n*p
    dp/dt = -d*p + g*C*n*p
    """
    n, p = y[0], y[1]
    dn = r * n - C * n * p
    dp = -d * p + g_conv * C * n * p
    return np.array([dn, dp])


def _jacobian(t, y, r=1.0, C=0.01, d=0.5, g_conv=0.1, **kw):
    n, p = y[0], y[1]
    return np.array([
        [r - C * p, -C * n],
        [g_conv * C * p, -d + g_conv * C * n],
    ])


def _nullclines(params, n_range):
    """Predator-prey nullclines:
    Prey: dn/dt=0 -> p = r/C (horizontal line)
    Predator: dp/dt=0 -> n = d/(g*C) (vertical line)
    """
    r = params["r"]
    C = params["C"]
    d = params["d"]
    g_conv = params["g_conv"]

    # Prey nullcline: p = r/C
    prey_null_val = r / C if C != 0 else 0
    # Predator nullcline: n = d/(g*C)
    pred_null_val = d / (g_conv * C) if (g_conv * C) != 0 else 0

    return {
        "prey_nullcline": {"type": "horizontal", "value": prey_null_val, "label": "Prey nullcline (dN/dt=0)"},
        "pred_nullcline": {"type": "vertical", "value": pred_null_val, "label": "Predator nullcline (dP/dt=0)"},
    }


predator_prey_model = Model(
    name="Predator-Prey",
    n_dims=2,
    var_names=["Prey (N)", "Predator (P)"],
    param_defs={
        "r": ParamDef(default=1.0, min=0.01, max=5.0, step=0.1, label="Prey growth rate (r)"),
        "C": ParamDef(default=0.01, min=0.001, max=0.1, step=0.001, label="Capture rate (C)"),
        "d": ParamDef(default=0.5, min=0.01, max=5.0, step=0.1, label="Predator death rate (d)"),
        "g_conv": ParamDef(default=0.1, min=0.01, max=1.0, step=0.01, label="Conversion efficiency (g)"),
    },
    f=_f,
    jacobian=_jacobian,
    nullcline_funcs=_nullclines,
)
