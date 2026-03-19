from .exponential import exponential_model
from .logistic_delay import logistic_delay_model
from .predator_prey import predator_prey_model
from .lotka_volterra import lotka_volterra_model
from .functional_response import functional_response_model

MODEL_REGISTRY = {
    "Exponential Growth": exponential_model,
    "Logistic with Delay": logistic_delay_model,
    "Predator-Prey": predator_prey_model,
    "Lotka-Volterra Competition": lotka_volterra_model,
    "Predator-Prey + Functional Response": functional_response_model,
}
