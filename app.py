import streamlit as st
import numpy as np

from models import MODEL_REGISTRY
from solvers import SOLVERS, SOLVER_ORDER, solve, solve_delay
from visualization.time_series import plot_time_series, plot_comparison
from visualization.phase_plane import plot_phase_plane
from visualization.error_plot import plot_error_analysis

st.set_page_config(
    page_title="Análisis Numérico (2005 → 2026)",
    page_icon="📐",
    layout="wide",
)

st.title("Análisis Numérico")
st.caption("Numerical ODE solvers for population dynamics")

# --- Sidebar ---
with st.sidebar:
    st.header("Configuration")

    MODEL_HELP = {
        "Exponential Growth": "Unlimited growth: dN/dt = r*N. Population grows (or decays) exponentially with no constraints.",
        "Logistic with Delay": "Logistic growth where the population responds to its own density after a time delay tau, which can cause oscillations.",
        "Predator-Prey": "Classic Lotka-Volterra: prey grow, predators eat prey and die. Produces characteristic population cycles.",
        "Lotka-Volterra Competition": "Two species competing for the same resource. Outcome depends on competition coefficients — coexistence or exclusion.",
        "Predator-Prey + Functional Response": "Predator-prey with realistic feeding: Type I (linear), Type II (saturation), or Type III (sigmoidal switching).",
    }

    SOLVER_HELP = {
        "Forward Euler": "Simplest method, O(h). Explicit — fast but can be unstable with large step sizes.",
        "Backward Euler": "Implicit method, O(h). Requires Newton iteration but handles stiff systems well.",
        "RK4": "Classic 4th-order Runge-Kutta, O(h^4). Excellent accuracy per step — the workhorse of ODE solvers.",
    }

    model_name = st.selectbox("Model", list(MODEL_REGISTRY.keys()))
    model = MODEL_REGISTRY[model_name]
    st.caption(MODEL_HELP.get(model_name, ""))

    solver_name = st.selectbox("Solver", list(SOLVERS.keys()))
    step_fn = SOLVERS[solver_name]
    st.caption(SOLVER_HELP.get(solver_name, ""))

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

    st.divider()
    with st.expander("📚 Learn — Models & Methods"):
        st.markdown("#### Population Models")

        st.markdown("""
**Exponential Growth** — dN/dt = r·N. Unlimited growth proportional to current population.
The Malthusian model; good approximation when populations are well below carrying capacity.

**Logistic + Delay** — dN/dt = r·N·(1 - N(t-τ)/K). Adds a carrying capacity K and a time
delay τ. The delay causes overshoot and oscillations — the larger r·τ, the more dramatic.

**Predator-Prey** — Classic Lotka-Volterra (1925/1926). Prey grow, predators eat prey and
die. Produces characteristic boom-bust population cycles (e.g., lynx and snowshoe hare).

**Lotka-Volterra Competition** — Two species competing for the same resource. The competition
coefficients a and b determine whether they coexist or one excludes the other.

**Functional Responses** — Predator-prey with realistic feeding rates:
- *Type I* (linear): predation rate = C·N, no upper limit
- *Type II* (Holling): C·N/(1+C·h·N), predator saturates at high prey density
- *Type III* (sigmoidal): C·N²/(1+C·h·N²), low predation at low prey density (prey refuge)
""")

        st.markdown("#### Numerical Methods")

        st.markdown("""
**Forward Euler** — y_{n+1} = y_n + h·f(t_n, y_n). Simplest method, O(h) accuracy.
Fast but can be unstable with large step sizes. Try Predator-Prey with h=0.5 to see it diverge.

**Backward Euler** — y_{n+1} = y_n + h·f(t_{n+1}, y_{n+1}). Implicit — requires solving a
nonlinear equation via Newton iteration at each step. Same O(h) accuracy but unconditionally
stable, making it ideal for stiff systems.

**RK4** — Evaluates f at four points per step, O(h⁴) accuracy. Halving h reduces error by 16x.
The workhorse of scientific computing — excellent accuracy per function evaluation.

**Adaptive stepping** uses Richardson extrapolation: compares one full step vs two half-steps.
If error > tolerance, the step is rejected and h is halved. If error < tolerance/4, h is doubled.
This automatically uses small steps where needed and large steps where the solution is smooth.
""")

        st.markdown("#### Further Reading")
        st.markdown("""
- [Strogatz — Nonlinear Dynamics and Chaos (YouTube lectures)](https://www.youtube.com/playlist?list=PLbN57C5Zdl6j_qJA-pARJnKsmROzPnO9V)
- [Edelstein-Keshet — *Mathematical Models in Biology* (free PDF)](https://sites.math.rutgers.edu/~zeilberg/Bio25/keshet/keshet0.pdf)
- [Scholarpedia — Runge-Kutta methods](http://www.scholarpedia.org/article/Runge-Kutta_methods)
- [Holling's Functional Responses — NIMBioS module](https://legacy.nimbios.org//~gross/bioed/bealsmodules/holling.html)
""")


def run_solver(step_fn, model, params, t_span, y0, h, adaptive, tol, order=1):
    """Run the solver, routing delay models to the dedicated delay solver."""
    if model.has_delay:
        return solve_delay(step_fn, model.f, t_span, y0, h, params,
                           adaptive=adaptive, tol=tol or 1e-4, order=order)
    else:
        return solve(step_fn, model.f, t_span, y0, h,
                     adaptive=adaptive, tol=tol or 1e-4, order=order,
                     **params)


# --- Run simulation ---
with st.spinner("Running solver..."):
    solver_order = SOLVER_ORDER.get(solver_name, 1)
    result = run_solver(step_fn, model, params, (0, t_max), y0, h, adaptive, tol, order=solver_order)

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
        solver_list = list(SOLVERS.items())
        progress = st.progress(0, text="Running solvers...")
        for i, (sname, sfn) in enumerate(solver_list):
            progress.progress((i) / len(solver_list), text=f"Running {sname}...")
            sorder = SOLVER_ORDER.get(sname, 1)
            comparison_results[sname] = run_solver(
                sfn, model, params, (0, t_max), y0, h, adaptive, tol, order=sorder
            )
        progress.progress(1.0, text="Done!")

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
    "ITBA (Instituto Tecnológico de Buenos Aires), February 2005. Recreated in Python + Streamlit, 2026."
)
