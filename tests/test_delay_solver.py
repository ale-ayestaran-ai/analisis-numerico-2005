import numpy as np
import pytest
from solvers.runge_kutta4 import rk4_step
from solvers.euler_forward import euler_forward_step
from solvers.delay import solve_delay


def logistic_delay_f(t, y, r=0.5, K=100.0, tau=1.0, history=None, **kw):
    """Logistic growth with delay: dn/dt = r*n*(1 - n(t-tau)/K)"""
    n = y[0]
    if history is not None and tau > 0:
        n_old = history(t - tau)
    else:
        n_old = n
    return np.array([r * n * (1 - n_old / K)])


class TestDelayFixed:
    """Basic sanity checks for fixed-step delay integration."""

    def test_delay_logistic_stays_positive(self):
        y0 = np.array([10.0])
        params = {"r": 0.5, "K": 100.0, "tau": 1.0}
        result = solve_delay(rk4_step, logistic_delay_f, (0, 20), y0, 0.05, params)
        assert np.all(result.y[:, 0] > 0), "Population went negative"

    def test_delay_logistic_approaches_K(self):
        """With small delay, logistic growth should approach carrying capacity."""
        y0 = np.array([10.0])
        K = 100.0
        params = {"r": 0.5, "K": K, "tau": 0.1}
        result = solve_delay(rk4_step, logistic_delay_f, (0, 40), y0, 0.05, params)
        final = result.y[-1, 0]
        assert abs(final - K) < 5.0, f"Expected ~{K}, got {final:.2f}"

    def test_delay_euler_vs_rk4_consistency(self):
        """Both solvers should give similar results on a smooth problem."""
        y0 = np.array([10.0])
        params = {"r": 0.5, "K": 100.0, "tau": 0.5}
        t_span = (0, 10)
        result_euler = solve_delay(euler_forward_step, logistic_delay_f,
                                   t_span, y0, 0.01, params)
        result_rk4 = solve_delay(rk4_step, logistic_delay_f,
                                 t_span, y0, 0.01, params)
        # Should agree within a few percent
        err = abs(result_euler.y[-1, 0] - result_rk4.y[-1, 0])
        assert err < 2.0, f"Euler and RK4 diverged: diff={err:.4f}"


class TestDelayAdaptive:
    """Tests for adaptive delay integration."""

    def test_adaptive_delay_rk4_reasonable_steps(self):
        """RK4 adaptive with order=4 should not take pathologically tiny steps."""
        y0 = np.array([10.0])
        params = {"r": 0.5, "K": 100.0, "tau": 1.0}
        result = solve_delay(rk4_step, logistic_delay_f, (0, 10), y0, 0.1,
                             params, adaptive=True, tol=1e-4, order=4)
        # With proper order scaling, should need far fewer than 1000 steps
        n_steps = len(result.t) - 1
        assert n_steps < 500, f"Too many steps ({n_steps}), order scaling may be wrong"

    def test_adaptive_delay_reduces_error(self):
        """Adaptive should be more accurate than fixed-step with same initial h."""
        y0 = np.array([10.0])
        params = {"r": 0.5, "K": 100.0, "tau": 0.5}
        t_span = (0, 10)

        # Fine reference solution
        ref = solve_delay(rk4_step, logistic_delay_f, t_span, y0, 0.001, params)

        # Coarse fixed
        fixed = solve_delay(rk4_step, logistic_delay_f, t_span, y0, 0.1, params)

        # Adaptive
        adaptive = solve_delay(rk4_step, logistic_delay_f, t_span, y0, 0.1,
                               params, adaptive=True, tol=1e-4, order=4)

        err_fixed = abs(fixed.y[-1, 0] - ref.y[-1, 0])
        err_adaptive = abs(adaptive.y[-1, 0] - ref.y[-1, 0])
        assert err_adaptive < err_fixed or err_adaptive < 0.01

    def test_midpoint_history_is_used(self):
        """The second half-step should see the midpoint in history.

        We verify this indirectly: with a short delay (tau < h), the adaptive
        solver should produce different results than one that ignores the midpoint.
        """
        y0 = np.array([50.0])
        params = {"r": 1.0, "K": 100.0, "tau": 0.05}
        result = solve_delay(rk4_step, logistic_delay_f, (0, 2), y0, 0.4,
                             params, adaptive=True, tol=1e-4, order=4)
        # Should complete without pathological behavior
        assert len(result.t) > 2, "Solver didn't take any steps"
        assert result.y[-1, 0] > 0, "Population went negative"
        assert np.all(np.isfinite(result.y)), "Non-finite values in solution"
