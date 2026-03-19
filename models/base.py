from __future__ import annotations

from dataclasses import dataclass, field
from typing import Callable, Optional


@dataclass
class ParamDef:
    default: float
    min: float
    max: float
    step: float
    label: str


@dataclass
class Model:
    name: str
    n_dims: int
    var_names: list[str]
    param_defs: dict[str, ParamDef]
    f: Callable  # f(t, y, **params) -> np.ndarray
    jacobian: Optional[Callable] = None  # jacobian(t, y, **params) -> np.ndarray
    nullcline_funcs: Optional[Callable] = None  # (params, n_range) -> list of traces
    has_delay: bool = False
    extra_widgets: dict = field(default_factory=dict)  # e.g. dropdowns
