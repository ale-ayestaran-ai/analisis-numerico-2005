import numpy as np
from dataclasses import dataclass, field


@dataclass
class SolveResult:
    t: np.ndarray
    y: np.ndarray  # shape (n_steps, n_dims)
    h_history: list = field(default_factory=list)
    error_history: list = field(default_factory=list)
    n_rejected: int = 0


def solve(step_fn, f, t_span, y0, h, adaptive=False, tol=1e-4,
          h_min=1e-8, h_max=None, max_steps=100_000, **kwargs):
    """Integrate an ODE system using the given step function.

    Uses Richardson extrapolation for error estimation in adaptive mode:
    compare one full step vs two half-steps.

    Adaptive logic (matching original Matlab):
    - If error > tol: reject step, halve h
    - If error < tol/4 and h < h_max: accept step, double h
    - Otherwise: accept step, keep h
    """
    t0, tf = t_span
    y0 = np.asarray(y0, dtype=float)
    if h_max is None:
        h_max = (tf - t0) / 4

    t_list = [t0]
    y_list = [y0.copy()]
    h_history = []
    error_history = []
    n_rejected = 0

    t = t0
    y = y0.copy()
    step = 0

    while t < tf - 1e-12 and step < max_steps:
        # Don't overshoot the end
        if t + h > tf:
            h = tf - t

        if adaptive:
            # One full step
            y_full = step_fn(f, t, y, h, **kwargs)

            # Two half-steps
            y_half = step_fn(f, t, y, h / 2, **kwargs)
            y_half = step_fn(f, t + h / 2, y_half, h / 2, **kwargs)

            # Error estimate
            error = np.max(np.abs(y_half - y_full))

            if error > tol and h > h_min:
                # Reject, halve step size
                h = max(h / 2, h_min)
                n_rejected += 1
                continue

            # Accept the more accurate result (two half-steps)
            y = y_half
            h_history.append(h)
            error_history.append(error)

            # Adjust step size for next iteration
            if error < tol / 4 and h < h_max:
                h = min(h * 2, h_max)
        else:
            y = step_fn(f, t, y, h, **kwargs)
            h_history.append(h)
            error_history.append(0.0)

        t = t + h_history[-1] if adaptive else t + h
        t_list.append(t)
        y_list.append(y.copy())
        step += 1

    return SolveResult(
        t=np.array(t_list),
        y=np.array(y_list),
        h_history=h_history,
        error_history=error_history,
        n_rejected=n_rejected,
    )
