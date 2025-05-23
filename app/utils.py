def is_valid_cpf(cpf: str) -> bool:
    cpf = ''.join(filter(str.isdigit, cpf))
    if len(cpf) != 11 or cpf == cpf[0] * 11:
        return False

    def calc_digit(digits, factor):
        total = sum(int(d) * f for d, f in zip(digits, range(factor, 1, -1)))
        rest = total % 11
        return 0 if rest < 2 else 11 - rest

    digits = list(map(int, cpf))
    first_digit = calc_digit(digits[:9], 10)
    second_digit = calc_digit(digits[:9] + [first_digit], 11)

    return digits[9] == first_digit and digits[10] == second_digit