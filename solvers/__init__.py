from .euler_forward import euler_forward_step
from .euler_backward import euler_backward_step
from .runge_kutta4 import rk4_step
from .adaptive import solve, SolveResult
from .delay import solve_delay

SOLVERS = {
    "Forward Euler": euler_forward_step,
    "Backward Euler": euler_backward_step,
    "RK4": rk4_step,
}

SOLVER_ORDER = {
    "Forward Euler": 1,
    "Backward Euler": 1,
    "RK4": 4,
}
