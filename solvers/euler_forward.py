import numpy as np


def euler_forward_step(f, t, y, h, **kwargs):
    """Forward Euler: y_{n+1} = y_n + h * f(t_n, y_n)"""
    return y + h * np.asarray(f(t, y, **kwargs))
