import random

def calculate_score(cpf: str) -> int:
    random.seed(cpf)
    return random.randint(300, 850)