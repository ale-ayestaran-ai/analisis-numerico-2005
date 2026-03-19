import numpy as np
from .base import Model, ParamDef


def _f(t, y, r=1.0, K=100.0, tau=1.0, history=None, **kw):
    """Logistic growth with time delay: dn/dt = r*n*(1 - n(t-tau)/K)

    When t < tau, n_old = n(0) (initial condition).
    When t >= tau, n_old = n(t - tau) from history.
    """
    n = y[0]
    if history is not None and tau > 0:
        n_old = history(t - tau)
    else:
        n_old = n
    return np.array([r * n * (1 - n_old / K)])


def _jacobian(t, y, r=1.0, K=100.0, tau=1.0, history=None, **kw):
    """Jacobian w.r.t. current state n(t).

    With delay: n_old = n(t-tau) is a past value, constant w.r.t. n(t),
    so df/dn = r * (1 - n_old / K).
    Without delay (fallback to standard logistic): df/dn = r * (1 - 2n/K).
    """
    n = y[0]
    if history is not None and tau > 0:
        n_old = history(t - tau)
        if isinstance(n_old, (list, np.ndarray)):
            n_old = n_old[0]
        return np.array([[r * (1 - n_old / K)]])
    else:
        return np.array([[r * (1 - 2 * n / K)]])


logistic_delay_model = Model(
    name="Logistic with Delay",
    n_dims=1,
    var_names=["N"],
    param_defs={
        "r": ParamDef(default=0.5, min=0.01, max=5.0, step=0.1, label="Growth rate (r)"),
        "K": ParamDef(default=100.0, min=10.0, max=1000.0, step=10.0, label="Carrying capacity (K)"),
        "tau": ParamDef(default=1.0, min=0.0, max=20.0, step=0.5, label="Time delay (τ)"),
    },
    f=_f,
    jacobian=_jacobian,
    has_delay=True,
)
