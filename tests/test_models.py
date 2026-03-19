import numpy as np
import pytest
from models import MODEL_REGISTRY


class TestModelDerivatives:
    """Verify each model's f() returns the correct shape and Jacobians match finite differences."""

    @pytest.mark.parametrize("model_name", list(MODEL_REGISTRY.keys()))
    def test_f_returns_correct_shape(self, model_name):
        model = MODEL_REGISTRY[model_name]
        defaults = {k: v.default for k, v in model.param_defs.items()}
        # Add extra widget defaults
        for k, w in model.extra_widgets.items():
            defaults[k] = w["options"][0]
        # Add history for delay model
        if model.has_delay:
            defaults["history"] = lambda t: defaults.get("K", 100.0) / 2

        y0 = np.ones(model.n_dims) * 10.0
        result = model.f(0, y0, **defaults)
        assert result.shape == (model.n_dims,), f"Expected shape ({model.n_dims},), got {result.shape}"

    @pytest.mark.parametrize("model_name", [
        name for name, m in MODEL_REGISTRY.items()
        if m.jacobian is not None and not m.has_delay
    ])
    def test_jacobian_matches_finite_diff(self, model_name):
        model = MODEL_REGISTRY[model_name]
        defaults = {k: v.default for k, v in model.param_defs.items()}
        for k, w in model.extra_widgets.items():
            defaults[k] = w["options"][0]

        y0 = np.ones(model.n_dims) * 10.0
        J_analytical = np.atleast_2d(model.jacobian(0, y0, **defaults))

        # Finite-difference Jacobian
        eps = 1e-6
        n = model.n_dims
        J_fd = np.zeros((n, n))
        f0 = model.f(0, y0, **defaults)
        for j in range(n):
            y_pert = y0.copy()
            y_pert[j] += eps
            f_pert = model.f(0, y_pert, **defaults)
            J_fd[:, j] = (f_pert - f0) / eps

        np.testing.assert_allclose(J_analytical, J_fd, atol=1e-4, rtol=1e-3,
                                   err_msg=f"Jacobian mismatch for {model_name}")


class TestExponentialAnalytical:
    def test_matches_exact_solution(self):
        from solvers.runge_kutta4 import rk4_step
        from solvers.adaptive import solve

        model = MODEL_REGISTRY["Exponential Growth"]
        r = 0.5
        n0 = 10.0
        t_end = 2.0

        result = solve(rk4_step, model.f, (0, t_end), np.array([n0]), 0.01, r=r)
        exact = n0 * np.exp(r * t_end)
        assert abs(result.y[-1, 0] - exact) / exact < 1e-6
