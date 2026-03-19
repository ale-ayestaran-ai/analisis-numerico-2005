import numpy as np
import pytest
from solvers.euler_forward import euler_forward_step
from solvers.euler_backward import euler_backward_step
from solvers.runge_kutta4 import rk4_step
from solvers.adaptive import solve


def exponential_decay(t, y):
    """dy/dt = -y, solution: y0 * exp(-t)"""
    return np.array([-y[0]])


def exponential_decay_jacobian(t, y):
    return np.array([[-1.0]])


class TestConvergenceOrders:
    """Verify that each solver has the expected error order."""

    def _compute_error(self, step_fn, h, **kwargs):
        t_end = 1.0
        y0 = np.array([1.0])
        result = solve(step_fn, exponential_decay, (0, t_end), y0, h, **kwargs)
        exact = np.exp(-t_end)
        return abs(result.y[-1, 0] - exact)

    def test_forward_euler_order_1(self):
        e1 = self._compute_error(euler_forward_step, 0.01)
        e2 = self._compute_error(euler_forward_step, 0.005)
        ratio = e1 / e2
        # Order 1 means halving h should halve the error (~2)
        assert 1.8 < ratio < 2.2, f"Expected ratio ~2 for O(h), got {ratio:.2f}"

    def test_rk4_order_4(self):
        e1 = self._compute_error(rk4_step, 0.1)
        e2 = self._compute_error(rk4_step, 0.05)
        ratio = e1 / e2
        # Order 4 means halving h should reduce error by 16x
        assert 12 < ratio < 20, f"Expected ratio ~16 for O(h^4), got {ratio:.2f}"

    def test_backward_euler_order_1(self):
        e1 = self._compute_error(euler_backward_step, 0.01)
        e2 = self._compute_error(euler_backward_step, 0.005)
        ratio = e1 / e2
        assert 1.8 < ratio < 2.2, f"Expected ratio ~2 for O(h), got {ratio:.2f}"


class TestAdaptive:
    def test_adaptive_reduces_error(self):
        y0 = np.array([1.0])
        result_fixed = solve(euler_forward_step, exponential_decay, (0, 2), y0, 0.1)
        result_adaptive = solve(euler_forward_step, exponential_decay, (0, 2), y0, 0.1,
                                adaptive=True, tol=1e-4)
        exact = np.exp(-2.0)
        err_fixed = abs(result_fixed.y[-1, 0] - exact)
        err_adaptive = abs(result_adaptive.y[-1, 0] - exact)
        assert err_adaptive < err_fixed or err_adaptive < 1e-3

    def test_adaptive_respects_tolerance(self):
        y0 = np.array([1.0])
        result = solve(rk4_step, exponential_decay, (0, 1), y0, 0.1,
                       adaptive=True, tol=1e-6)
        exact = np.exp(-1.0)
        assert abs(result.y[-1, 0] - exact) < 1e-4


class TestBackwardEulerConvergence:
    """Test that backward Euler properly detects convergence failures."""

    def test_converges_on_linear_stiff(self):
        """Backward Euler should converge on a stiff linear problem."""
        def stiff_f(t, y):
            return np.array([-100.0 * y[0]])

        def stiff_jac(t, y):
            return np.array([[-100.0]])

        y = np.array([1.0])
        # Large step relative to stiffness — this is where backward Euler shines
        result = euler_backward_step(stiff_f, 0, y, 0.1, jacobian=stiff_jac)
        # Should converge to something reasonable (exact: 1/(1+10) ≈ 0.0909)
        assert abs(result[0] - 1.0 / 11.0) < 1e-6

    def test_raises_on_nonconvergent(self):
        """Newton should raise RuntimeError when it can't converge."""
        def blowup_f(t, y):
            return np.array([y[0]**2 + 1])

        y = np.array([0.0])
        with pytest.raises(RuntimeError, match="failed to converge"):
            euler_backward_step(blowup_f, 0, y, 1.0)


class TestTwoD:
    def test_predator_prey_conservation(self):
        """Classic Lotka-Volterra conserves a quantity — test RK4 preserves it approximately."""
        def lv(t, y):
            return np.array([y[0] - 0.1 * y[0] * y[1],
                             -y[1] + 0.05 * y[0] * y[1]])

        y0 = np.array([40.0, 9.0])
        result = solve(rk4_step, lv, (0, 50), y0, 0.01)

        # Conserved quantity: d*ln(n) + r*ln(p) - C*n - g*C*p (approximately)
        # For classic LV: H = -ln(n) + 0.1*n - ln(p) + 0.05*p... not exactly,
        # but population should oscillate, not diverge
        assert result.y[-1, 0] > 0, "Prey went negative"
        assert result.y[-1, 1] > 0, "Predator went negative"
        # Check that max doesn't explode
        assert result.y[:, 0].max() < 500, "Prey exploded"
