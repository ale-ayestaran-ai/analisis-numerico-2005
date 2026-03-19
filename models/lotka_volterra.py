import numpy as np
from .base import Model, ParamDef


def _f(t, y, r1=1.0, r2=1.0, K1=200.0, K2=200.0, a=0.5, b=0.5, **kw):
    """Lotka-Volterra competition:
    dn1/dt = r1*n1*(1 - (n1 + a*n2)/K1)
    dn2/dt = r2*n2*(1 - (n2 + b*n1)/K2)
    """
    n1, n2 = y[0], y[1]
    dn1 = r1 * n1 * (1 - (n1 + a * n2) / K1)
    dn2 = r2 * n2 * (1 - (n2 + b * n1) / K2)
    return np.array([dn1, dn2])


def _jacobian(t, y, r1=1.0, r2=1.0, K1=200.0, K2=200.0, a=0.5, b=0.5, **kw):
    n1, n2 = y[0], y[1]
    return np.array([
        [r1 * (1 - (2 * n1 + a * n2) / K1), -r1 * a * n1 / K1],
        [-r2 * b * n2 / K2, r2 * (1 - (2 * n2 + b * n1) / K2)],
    ])


def _nullclines(params, n_range):
    """Lotka-Volterra competition nullclines (linear):
    Species 1: n1 = K1 - a*n2 (i.e. n1 + a*n2 = K1)
    Species 2: n2 = K2 - b*n1 (i.e. n2 + b*n1 = K2)

    Original Matlab plots these as lines:
    Isocline 1: from (0, K1) to (K1/a, 0) — in (n2, n1) space
    Isocline 2: from (K2, 0) to (0, K2/b) — in (n2, n1) space

    We plot in (n1, n2) space:
    Nullcline 1: n2 = (K1 - n1) / a
    Nullcline 2: n2 = K2 - b * n1
    """
    K1 = params["K1"]
    K2 = params["K2"]
    a = params["a"]
    b = params["b"]

    n1_vals = np.linspace(0, max(K1, K2) * 1.2, 200)
    nc1_n2 = (K1 - n1_vals) / a if a != 0 else np.zeros_like(n1_vals)
    nc2_n2 = K2 - b * n1_vals

    return {
        "nullcline_1": {
            "type": "curve",
            "x": n1_vals, "y": nc1_n2,
            "label": "Species 1 nullcline (dN₁/dt=0)",
        },
        "nullcline_2": {
            "type": "curve",
            "x": n1_vals, "y": nc2_n2,
            "label": "Species 2 nullcline (dN₂/dt=0)",
        },
    }


lotka_volterra_model = Model(
    name="Lotka-Volterra Competition",
    n_dims=2,
    var_names=["Species 1 (N₁)", "Species 2 (N₂)"],
    param_defs={
        "r1": ParamDef(default=1.0, min=0.01, max=5.0, step=0.1, label="Growth rate species 1 (r₁)"),
        "r2": ParamDef(default=1.0, min=0.01, max=5.0, step=0.1, label="Growth rate species 2 (r₂)"),
        "K1": ParamDef(default=200.0, min=10.0, max=1000.0, step=10.0, label="Carrying capacity K₁"),
        "K2": ParamDef(default=200.0, min=10.0, max=1000.0, step=10.0, label="Carrying capacity K₂"),
        "a": ParamDef(default=0.5, min=0.0, max=3.0, step=0.1, label="Competition coeff (a: effect of N₂ on N₁)"),
        "b": ParamDef(default=0.5, min=0.0, max=3.0, step=0.1, label="Competition coeff (b: effect of N₁ on N₂)"),
    },
    f=_f,
    jacobian=_jacobian,
    nullcline_funcs=_nullclines,
)
