from __future__ import annotations

import plotly.graph_objects as go
from solvers.adaptive import SolveResult


def plot_time_series(result: SolveResult, var_names: list[str], title: str = "Population over Time") -> go.Figure:
    colors = ["#2196F3", "#F44336", "#4CAF50", "#FF9800"]
    fig = go.Figure()

    for i, name in enumerate(var_names):
        fig.add_trace(go.Scatter(
            x=result.t,
            y=result.y[:, i],
            mode="lines",
            name=name,
            line=dict(color=colors[i % len(colors)], width=2),
        ))

    fig.update_layout(
        title=title,
        xaxis_title="Time",
        yaxis_title="Population",
        hovermode="x unified",
        template="plotly_white",
        legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="right", x=1),
    )
    return fig


def plot_comparison(results: dict[str, SolveResult], var_names: list[str]) -> go.Figure:
    """Overlay results from multiple solvers."""
    solver_styles = {
        "Forward Euler": dict(dash="dot"),
        "Backward Euler": dict(dash="dash"),
        "RK4": dict(dash="solid"),
    }
    colors = ["#2196F3", "#F44336", "#4CAF50", "#FF9800"]
    fig = go.Figure()

    for solver_name, result in results.items():
        style = solver_styles.get(solver_name, {})
        for i, var_name in enumerate(var_names):
            fig.add_trace(go.Scatter(
                x=result.t,
                y=result.y[:, i],
                mode="lines",
                name=f"{var_name} ({solver_name})",
                line=dict(color=colors[i % len(colors)], width=2, **style),
            ))

    fig.update_layout(
        title="Method Comparison",
        xaxis_title="Time",
        yaxis_title="Population",
        hovermode="x unified",
        template="plotly_white",
        legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="right", x=1),
    )
    return fig
