import numpy as np


def rk4_step(f, t, y, h, **kwargs):
    """Classic 4-stage Runge-Kutta method."""
    k1 = np.asarray(f(t, y, **kwargs))
    k2 = np.asarray(f(t + h / 2, y + h / 2 * k1, **kwargs))
    k3 = np.asarray(f(t + h / 2, y + h / 2 * k2, **kwargs))
    k4 = np.asarray(f(t + h, y + h * k3, **kwargs))
    return y + (h / 6) * (k1 + 2 * k2 + 2 * k3 + k4)
