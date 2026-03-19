import numpy as np
import plotly.graph_objects as go
import plotly.figure_factory as ff
from solvers.adaptive import SolveResult


def plot_phase_plane(result: SolveResult, model, params: dict,
                     show_vector_field: bool = True,
                     show_nullclines: bool = True) -> go.Figure:
    """Phase plane plot for 2D models: trajectory, nullclines, vector field."""
    fig = go.Figure()

    n_vals = result.y[:, 0]
    p_vals = result.y[:, 1]

    # Trajectory
    fig.add_trace(go.Scatter(
        x=n_vals, y=p_vals,
        mode="lines+markers",
        name="Trajectory",
        line=dict(color="#333333", width=2),
        marker=dict(size=3, color="#333333"),
    ))

    # Start and end markers
    fig.add_trace(go.Scatter(
        x=[n_vals[0]], y=[p_vals[0]],
        mode="markers",
        name="Start",
        marker=dict(size=12, color="#4CAF50", symbol="circle"),
    ))
    fig.add_trace(go.Scatter(
        x=[n_vals[-1]], y=[p_vals[-1]],
        mode="markers",
        name="End",
        marker=dict(size=12, color="#F44336", symbol="square"),
    ))

    # Determine plot range
    margin = 0.2
    x_max = max(n_vals.max(), 1) * (1 + margin)
    y_max = max(p_vals.max(), 1) * (1 + margin)

    # Vector field
    if show_vector_field:
        n_grid = 20
        x_pts = np.linspace(0, x_max, n_grid)
        y_pts = np.linspace(0, y_max, n_grid)
        X, Y = np.meshgrid(x_pts, y_pts)

        # Evaluate derivatives at all grid points (flattened to avoid nested loops)
        states = np.column_stack((X.ravel(), Y.ravel()))
        derivs = np.array([model.f(0, s, **params) for s in states])
        U = derivs[:, 0].reshape(n_grid, n_grid)
        V = derivs[:, 1].reshape(n_grid, n_grid)

        # Normalize arrows for visibility
        magnitude = np.hypot(U, V)
        max_mag = magnitude.max()
        if max_mag > 0:
            U_norm = U / max_mag
            V_norm = V / max_mag

            # Filter out very small arrows
            mask = magnitude > (max_mag * 0.01)

            # Single quiver trace instead of hundreds of annotations
            quiver_fig = ff.create_quiver(
                X[mask], Y[mask], U_norm[mask], V_norm[mask],
                scale=x_max / n_grid * 0.4,
                arrow_scale=0.3,
                name="Vector Field",
                line=dict(width=1, color="rgba(150,150,150,0.6)"),
            )
            fig.add_trace(quiver_fig.data[0])

    # Nullclines
    if show_nullclines and model.nullcline_funcs is not None:
        nullclines = model.nullcline_funcs(params, x_max)
        nc_colors = ["#F44336", "#2196F3"]

        for idx, (key, nc) in enumerate(nullclines.items()):
            color = nc_colors[idx % len(nc_colors)]
            if nc["type"] == "vertical" and np.isfinite(nc["value"]):
                fig.add_vline(
                    x=nc["value"],
                    line=dict(color=color, width=2, dash="dash"),
                    annotation_text=nc["label"],
                    annotation_position="top right",
                )
            elif nc["type"] == "horizontal" and np.isfinite(nc["value"]):
                fig.add_hline(
                    y=nc["value"],
                    line=dict(color=color, width=2, dash="dash"),
                    annotation_text=nc["label"],
                    annotation_position="top right",
                )
            elif nc["type"] == "curve":
                x_nc = nc["x"]
                y_nc = nc["y"]
                # Clip to positive values
                mask = (y_nc >= 0) & (y_nc <= y_max * 2) & (x_nc >= 0)
                fig.add_trace(go.Scatter(
                    x=x_nc[mask], y=y_nc[mask],
                    mode="lines",
                    name=nc["label"],
                    line=dict(color=color, width=2, dash="dash"),
                ))

    fig.update_layout(
        title="Phase Plane",
        xaxis_title=model.var_names[0],
        yaxis_title=model.var_names[1],
        xaxis=dict(range=[0, x_max]),
        yaxis=dict(range=[0, y_max]),
        template="plotly_white",
        showlegend=True,
    )
    return fig
