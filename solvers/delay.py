import warnings
import numpy as np
from .adaptive import SolveResult


def _make_history(t_list, y_list, y0_scalar, extra_points=None):
    """Build a history callback from accepted timesteps plus optional extras.

    Returns a function history(t_query) -> scalar, using piecewise-constant
    interpolation (latest value at or before t_query).
    """
    times = list(t_list)
    values = [yy[0] if hasattr(yy, "__len__") else yy for yy in y_list]

    if extra_points:
        for tt, yy in extra_points:
            times.append(tt)
            values.append(yy[0] if hasattr(yy, "__len__") else yy)

    order = np.argsort(times)
    times = np.asarray(times)[order]
    values = np.asarray(values)[order]

    def history(t_query):
        if t_query <= times[0]:
            return y0_scalar
        idx = np.searchsorted(times, t_query, side="right") - 1
        idx = max(0, min(idx, len(values) - 1))
        return values[idx]

    return history


def solve_delay(step_fn, f, t_span, y0, h, params, adaptive=False,
                tol=1e-4, h_min=1e-8, h_max=None, max_steps=100_000,
                order=1):
    """Integrate a delay differential equation with proper history management.

    Unlike the generic ODE solver, this maintains a growing history of accepted
    states so that f(t, y, history=...) can look up past values.

    In adaptive mode, the second half-step sees a temporary history that
    includes the midpoint state from the first half-step.
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
    y0_scalar = y0[0]

    while t < tf - 1e-12 and step < max_steps:
        current_h = min(h, tf - t)

        # Build history from accepted points
        base_history = _make_history(t_list, y_list, y0_scalar)
        f_kwargs = dict(params, history=base_history)

        if adaptive:
            # One full step (uses base history)
            y_full = step_fn(f, t, y, current_h, **f_kwargs)

            # First half-step (uses base history)
            y_half_1 = step_fn(f, t, y, current_h / 2, **f_kwargs)

            # Second half-step: build temporary history including the midpoint
            mid_history = _make_history(
                t_list, y_list, y0_scalar,
                extra_points=[(t + current_h / 2, y_half_1)],
            )
            f_kwargs_mid = dict(params, history=mid_history)
            y_half_2 = step_fn(
                f, t + current_h / 2, y_half_1, current_h / 2, **f_kwargs_mid,
            )

            # Error estimate (Richardson extrapolation, scaled by method order)
            error = np.max(np.abs(y_half_2 - y_full)) / ((2 ** order) - 1)

            if error > tol and current_h > h_min:
                h = max(current_h / 2, h_min)
                n_rejected += 1
                step += 1  # count rejected steps to prevent infinite loops
                continue

            if error > tol:
                warnings.warn(
                    f"Tolerance not met at t={t:.6g} (error={error:.2e}, "
                    f"tol={tol:.2e}). Step size already at h_min={h_min:.2e}.",
                    stacklevel=2,
                )

            y = y_half_2
            h_history.append(current_h)
            error_history.append(error)

            if error < tol / 4 and current_h < h_max:
                h = min(current_h * 2, h_max)
        else:
            y = step_fn(f, t, y, current_h, **f_kwargs)
            h_history.append(current_h)
            error_history.append(0.0)

        t = t + h_history[-1]
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
