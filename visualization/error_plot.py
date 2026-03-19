import plotly.graph_objects as go
from plotly.subplots import make_subplots
from solvers.adaptive import SolveResult


def plot_error_analysis(result: SolveResult) -> go.Figure:
    """Dual-axis plot: error estimate and step size over time."""
    if not result.h_history:
        fig = go.Figure()
        fig.add_annotation(text="No step data available", xref="paper", yref="paper",
                           x=0.5, y=0.5, showarrow=False, font=dict(size=16))
        return fig

    fig = make_subplots(specs=[[{"secondary_y": True}]])

    # Use midpoints of time intervals for step data
    t_steps = result.t[1:len(result.h_history) + 1]

    fig.add_trace(
        go.Scatter(
            x=t_steps,
            y=result.error_history,
            mode="lines",
            name="Error estimate",
            line=dict(color="#F44336", width=2),
        ),
        secondary_y=False,
    )

    fig.add_trace(
        go.Scatter(
            x=t_steps,
            y=result.h_history,
            mode="lines",
            name="Step size (h)",
            line=dict(color="#2196F3", width=2),
        ),
        secondary_y=True,
    )

    fig.update_layout(
        title=f"Error Analysis (rejected steps: {result.n_rejected})",
        xaxis_title="Time",
        hovermode="x unified",
        template="plotly_white",
        legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="right", x=1),
    )
    fig.update_yaxes(title_text="Error estimate", secondary_y=False)
    fig.update_yaxes(title_text="Step size", secondary_y=True)

    return fig
