import numpy as np
import plotly.graph_objects as go
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

        U = np.zeros_like(X)
        V = np.zeros_like(Y)

        for i in range(n_grid):
            for j in range(n_grid):
                state = np.array([X[i, j], Y[i, j]])
                deriv = model.f(0, state, **params)
                U[i, j] = deriv[0]
                V[i, j] = deriv[1]

        # Normalize arrows for visibility
        magnitude = np.sqrt(U**2 + V**2)
        max_mag = magnitude.max()
        if max_mag > 0:
            scale = x_max / n_grid * 0.4
            U_norm = U / max_mag * scale
            V_norm = V / max_mag * scale

        # Draw as annotations (Plotly quiver)
        for i in range(n_grid):
            for j in range(n_grid):
                if max_mag > 0 and magnitude[i, j] > max_mag * 0.01:
                    fig.add_annotation(
                        x=X[i, j] + U_norm[i, j],
                        y=Y[i, j] + V_norm[i, j],
                        ax=X[i, j],
                        ay=Y[i, j],
                        xref="x", yref="y",
                        axref="x", ayref="y",
                        showarrow=True,
                        arrowhead=2,
                        arrowsize=1,
                        arrowwidth=1,
                        arrowcolor="rgba(150,150,150,0.4)",
                    )

    # Nullclines
    if show_nullclines and model.nullcline_funcs is not None:
        nullclines = model.nullcline_funcs(params, x_max)
        nc_colors = ["#F44336", "#2196F3"]

        for idx, (key, nc) in enumerate(nullclines.items()):
            color = nc_colors[idx % len(nc_colors)]
            if nc["type"] == "vertical":
                fig.add_vline(
                    x=nc["value"],
                    line=dict(color=color, width=2, dash="dash"),
                    annotation_text=nc["label"],
                    annotation_position="top right",
                )
            elif nc["type"] == "horizontal":
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
