import warnings
import numpy as np


def euler_backward_step(f, t, y, h, jacobian=None, **kwargs):
    """Backward Euler with Newton iteration.

    Solves: y_{n+1} = y_n + h * f(t_{n+1}, y_{n+1})
    Uses Newton's method: F(y_{n+1}) = y_{n+1} - y_n - h*f(t_{n+1}, y_{n+1}) = 0

    Raises RuntimeError if Newton iteration fails to converge.
    """
    t_next = t + h
    y_next = y + h * np.asarray(f(t, y, **kwargs))  # Forward Euler as initial guess

    max_iter = 20
    tol = 1e-10
    converged = False

    for _ in range(max_iter):
        f_val = np.asarray(f(t_next, y_next, **kwargs))
        residual = y_next - y - h * f_val

        if np.max(np.abs(residual)) < tol:
            converged = True
            break

        if jacobian is not None:
            J = np.asarray(jacobian(t_next, y_next, **kwargs))
            J = np.atleast_2d(J)
            n = len(y_next)
            A = np.eye(n) - h * J
            delta = np.linalg.solve(A, residual)
        else:
            # Finite-difference Jacobian approximation
            n = len(y_next)
            J = np.zeros((n, n))
            eps = 1e-8
            for j in range(n):
                y_pert = y_next.copy()
                y_pert[j] += eps
                f_pert = np.asarray(f(t_next, y_pert, **kwargs))
                J[:, j] = (f_pert - f_val) / eps
            A = np.eye(n) - h * J
            delta = np.linalg.solve(A, residual)

        y_next = y_next - delta

    if not converged:
        final_residual = np.max(np.abs(
            y_next - y - h * np.asarray(f(t_next, y_next, **kwargs))
        ))
        raise RuntimeError(
            f"Backward Euler Newton iteration failed to converge at t={t_next:.6g}; "
            f"residual={final_residual:.3e}, max_iter={max_iter}"
        )

    return y_next
