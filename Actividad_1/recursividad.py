DENOMINACIONES = [100, 50, 20, 10, 5, 2, 1]
BILLETES = {100, 50, 20}
MONEDAS = {10, 5, 2, 1}

def enc_comb(valor, denominaciones, indice = 0, list_comb = None):
    if list_comb is None:
        list_comb = []

    combinaciones = []

    if valor == 0:
        return [list(list_comb)]

    if valor < 0 or indice >= len(denominaciones):
        return []

    denominacion = denominaciones[indice]

    max_veces = valor // denominacion
    for veces in range(max_veces, -1, -1):
        nuevo_comb = list_comb + [denominacion] * veces
        combinaciones += enc_comb (valor - denominacion * veces, denominaciones, indice + 1, nuevo_comb)

    return combinaciones

def texto_comb(combinacion):
    conteo = {}
    for valor in combinacion:
        conteo[valor] = conteo.get(valor, 0) + 1

    partes = []
    for denominacion in DENOMINACIONES:
        if denominacion in conteo:
            tipo = "billete" if denominacion in BILLETES else "moneda"
            cantidad = conteo[denominacion]
            plural = "s" if cantidad > 1 else ""
            partes.append(f"{cantidad} {tipo}{plural} de ${denominacion}")
    return ", ".join(partes)

def main():
    cantidad = int(input("Ingreses una billete o modenda de (100, 50, 20, 10, 5, 2, 1): $"))

    combinaciones = enc_comb(cantidad, DENOMINACIONES)

    print(f"\nSe encontraron {len(combinaciones)} combinaciones para la cantidad ${cantidad}:\n")
    for i, combinacion in enumerate(combinaciones, start = 1):
        print(f"{i}. {texto_comb(combinacion)}")

if __name__ == "__main__":
    main()
