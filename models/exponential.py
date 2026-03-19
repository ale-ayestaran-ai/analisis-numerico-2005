import numpy as np
from .base import Model, ParamDef


def _f(t, y, r=1.0, **kw):
    return np.array([r * y[0]])


def _jacobian(t, y, r=1.0, **kw):
    return np.array([[r]])


exponential_model = Model(
    name="Exponential Growth",
    n_dims=1,
    var_names=["N"],
    param_defs={
        "r": ParamDef(default=0.5, min=-2.0, max=5.0, step=0.1, label="Growth rate (r)"),
    },
    f=_f,
    jacobian=_jacobian,
)
