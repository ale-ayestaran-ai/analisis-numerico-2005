# Análisis Numérico (2005 → 2026)

**[Live demo](https://animal-population-dynamics.streamlit.app/)**

Interactive ODE solver for population dynamics — a faithful recreation of a 2005 Matlab university final as a modern web app.

## What is this?

In February 2005, I built an interactive Matlab GUI application for my Numerical Analysis final at ITBA (Instituto Tecnológico de Buenos Aires). It numerically solves ODE systems modeling population dynamics using three solvers (Forward Euler, Backward Euler, RK4) with adaptive step-size control.

21 years later, I recreated it as a web app with richer visualizations — phase planes, vector fields, error analysis — that weren't possible in old Matlab GUIDE.

## Models

All five original ODE systems, faithfully reproduced:

1. **Exponential Growth** — `dn/dt = r·n`
2. **Logistic with Time Delay** — `dn/dt = r·n·(1 - n(t-τ)/K)`
3. **Predator-Prey** — classic Lotka-Volterra predation
4. **Lotka-Volterra Competition** — two-species competition
5. **Predator-Prey + Functional Response** — with Type I/II/III (Holling) responses

## Solvers

All implemented from scratch (no scipy — that's the educational point):

- **Forward Euler** — explicit, first-order
- **Backward Euler** — implicit with Newton iteration, first-order
- **RK4** — classic 4th-order Runge-Kutta

Each supports adaptive step-size control via Richardson extrapolation.

## Run locally

```bash
pip install -r requirements.txt
streamlit run app.py
```

## Run tests

```bash
pip install pytest
pytest tests/ -v
```

## Tech stack

- **Python/NumPy** — numerical computation
- **Streamlit** — interactive UI (modern equivalent of Matlab GUIDE)
- **Plotly** — interactive charts with zoom, hover, pan

## Original code

The 2005 Matlab source files are preserved in the `original/` directory.
