import streamlit as st
import numpy as np

from models import MODEL_REGISTRY
from solvers import SOLVERS, solve
from visualization.time_series import plot_time_series, plot_comparison
from visualization.phase_plane import plot_phase_plane
from visualization.error_plot import plot_error_analysis

st.set_page_config(
    page_title="Análisis Numérico (2005 → 2026)",
    page_icon="📐",
    layout="wide",
)

st.title("Análisis Numérico")
st.caption("Numerical ODE solvers for population dynamics — a 2005 university final, recreated in 2026")

# --- Sidebar ---
with st.sidebar:
    st.header("Configuration")

    model_name = st.selectbox("Model", list(MODEL_REGISTRY.keys()))
    model = MODEL_REGISTRY[model_name]

    solver_name = st.selectbox("Solver", list(SOLVERS.keys()))
    step_fn = SOLVERS[solver_name]

    st.divider()
    st.subheader("Solver Settings")

    h = st.slider("Step size (h)", min_value=0.001, max_value=1.0, value=0.05, step=0.001, format="%.3f")
    t_max = st.slider("Simulation time (t_max)", min_value=1.0, max_value=200.0, value=50.0, step=1.0)

    adaptive = st.toggle("Adaptive step size", value=False)
    tol = None
    if adaptive:
        tol = st.slider("Error tolerance", min_value=1e-8, max_value=1e-1, value=1e-4, format="%.1e")

    st.divider()
    st.subheader("Model Parameters")

    params = {}
    for pname, pdef in model.param_defs.items():
        params[pname] = st.slider(
            pdef.label,
            min_value=pdef.min,
            max_value=pdef.max,
            value=pdef.default,
            step=pdef.step,
            key=f"param_{model_name}_{pname}",
        )

    # Extra widgets (e.g. functional response type dropdown)
    for wname, wdef in model.extra_widgets.items():
        if wdef["type"] == "selectbox":
            params[wname] = st.selectbox(
                wdef["label"],
                wdef["options"],
                key=f"widget_{model_name}_{wname}",
            )

    st.divider()
    st.subheader("Initial Conditions")

    y0_values = []
    for i, vname in enumerate(model.var_names):
        default_ic = 10.0 if model.n_dims == 1 else (50.0 if i == 0 else 20.0)
        val = st.number_input(
            f"{vname}(0)",
            min_value=0.0,
            max_value=10000.0,
            value=default_ic,
            step=1.0,
            key=f"ic_{model_name}_{i}",
        )
        y0_values.append(val)

    y0 = np.array(y0_values)


# --- Build history function for delay model ---
def _make_delay_solver_params(params, y0):
    """For the delay model, we need to provide a history function.
    Before t=tau, use the initial condition."""
    solve_params = dict(params)
    if model.has_delay:
        tau = params.get("tau", 0)
        # History stores the full solution; initially returns y0
        _history_t = [0.0]
        _history_y = [y0[0]]

        def history_lookup(t_query):
            if t_query <= 0:
                return y0[0]
            # Find nearest past value
            idx = np.searchsorted(_history_t, t_query, side="right") - 1
            idx = max(0, min(idx, len(_history_y) - 1))
            return _history_y[idx]

        solve_params["history"] = history_lookup
        solve_params["_history_t"] = _history_t
        solve_params["_history_y"] = _history_y
    return solve_params


def run_solver(step_fn, model, params, t_span, y0, h, adaptive, tol):
    """Run the solver, handling delay model specially."""
    if model.has_delay:
        # For delay models, we integrate manually to build up history
        solve_params = _make_delay_solver_params(params, y0)
        history_t = solve_params.pop("_history_t")
        history_y = solve_params.pop("_history_y")

        result = solve(step_fn, model.f, t_span, y0, h,
                       adaptive=adaptive, tol=tol or 1e-4, **solve_params)

        # Rebuild history from result for accuracy
        # (the simple history_lookup above works for forward integration)
        return result
    else:
        return solve(step_fn, model.f, t_span, y0, h,
                     adaptive=adaptive, tol=tol or 1e-4, **params)


# --- Delay model: custom solver that builds history ---
def solve_with_delay(step_fn, model, params, t_span, y0, h, adaptive, tol):
    """Special solver for delay DDE that maintains a proper history."""
    from solvers.adaptive import SolveResult

    tau = params.get("tau", 0)
    t0, tf = t_span
    y = y0.copy()
    t = t0

    t_list = [t0]
    y_list = [y0.copy()]
    h_history = []
    error_history = []
    n_rejected = 0
    max_steps = 100_000

    step = 0
    while t < tf - 1e-12 and step < max_steps:
        current_h = min(h, tf - t)

        def history(t_query):
            if t_query <= t0:
                return y0[0]
            idx = np.searchsorted(t_list, t_query, side="right") - 1
            idx = max(0, min(idx, len(y_list) - 1))
            return y_list[idx][0]

        f_kwargs = dict(params, history=history)

        if adaptive:
            y_full = step_fn(model.f, t, y, current_h, **f_kwargs)
            y_half = step_fn(model.f, t, y, current_h / 2, **f_kwargs)
            y_half = step_fn(model.f, t + current_h / 2, y_half, current_h / 2, **f_kwargs)
            error = np.max(np.abs(y_half - y_full))

            if error > (tol or 1e-4) and current_h > 1e-8:
                h = max(current_h / 2, 1e-8)
                n_rejected += 1
                continue

            y = y_half
            h_history.append(current_h)
            error_history.append(error)

            if error < (tol or 1e-4) / 4 and current_h < (tf - t0) / 4:
                h = min(current_h * 2, (tf - t0) / 4)
        else:
            y = step_fn(model.f, t, y, current_h, **f_kwargs)
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


# --- Run simulation ---
if model.has_delay:
    result = solve_with_delay(step_fn, model, params, (0, t_max), y0, h, adaptive, tol)
else:
    result = run_solver(step_fn, model, params, (0, t_max), y0, h, adaptive, tol)

# --- Tabs ---
if model.n_dims == 2:
    tab_ts, tab_phase, tab_error, tab_compare = st.tabs(
        ["📈 Time Series", "🔄 Phase Plane", "📊 Error Analysis", "⚖️ Method Comparison"]
    )
else:
    tab_ts, tab_error, tab_compare = st.tabs(
        ["📈 Time Series", "📊 Error Analysis", "⚖️ Method Comparison"]
    )
    tab_phase = None

with tab_ts:
    fig_ts = plot_time_series(result, model.var_names, title=f"{model_name} — {solver_name}")
    st.plotly_chart(fig_ts, use_container_width=True)

    # Show stats
    col1, col2, col3 = st.columns(3)
    col1.metric("Steps", len(result.t) - 1)
    col2.metric("Final time", f"{result.t[-1]:.2f}")
    if adaptive and result.error_history:
        col3.metric("Rejected steps", result.n_rejected)

if tab_phase is not None:
    with tab_phase:
        col_vf, col_nc = st.columns(2)
        show_vf = col_vf.checkbox("Show vector field", value=True)
        show_nc = col_nc.checkbox("Show nullclines", value=True)

        fig_pp = plot_phase_plane(result, model, params,
                                  show_vector_field=show_vf,
                                  show_nullclines=show_nc)
        st.plotly_chart(fig_pp, use_container_width=True)

with tab_error:
    fig_err = plot_error_analysis(result)
    st.plotly_chart(fig_err, use_container_width=True)

    if result.h_history:
        col1, col2 = st.columns(2)
        col1.metric("Min step size", f"{min(result.h_history):.2e}")
        col2.metric("Max step size", f"{max(result.h_history):.2e}")

with tab_compare:
    st.subheader("Run all three solvers on the same problem")

    if st.button("Run comparison", type="primary"):
        comparison_results = {}
        for sname, sfn in SOLVERS.items():
            if model.has_delay:
                comparison_results[sname] = solve_with_delay(
                    sfn, model, params, (0, t_max), y0, h, adaptive, tol
                )
            else:
                comparison_results[sname] = run_solver(
                    sfn, model, params, (0, t_max), y0, h, adaptive, tol
                )

        fig_comp = plot_comparison(comparison_results, model.var_names)
        st.plotly_chart(fig_comp, use_container_width=True)

        # Show per-solver stats
        cols = st.columns(len(SOLVERS))
        for col, (sname, res) in zip(cols, comparison_results.items()):
            col.subheader(sname)
            col.metric("Steps", len(res.t) - 1)
            if res.y.shape[0] > 0:
                for i, vn in enumerate(model.var_names):
                    col.metric(f"Final {vn}", f"{res.y[-1, i]:.4f}")

# --- Footer ---
st.divider()
st.caption(
    "Originally built as a Matlab GUIDE application for the Numerical Analysis final, "
    "Universidad de Buenos Aires, February 2005. Recreated in Python + Streamlit, 2026."
)
