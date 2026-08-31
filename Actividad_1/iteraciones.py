DENOMINACIONES = [100, 50, 20, 10, 5, 2, 1]
BILLETES = {100, 50, 20}
MONEDAS = {10, 5, 2, 1}

def enc_comb(valor, denominaciones):

    combinaciones = []
    list_comb = [(valor, 0, [])]

    while list_comb:
        valor_actual, indice, combinacion =list_comb.pop()
        if valor_actual == 0:
            combinaciones.append(combinacion)
            continue
        if valor_actual < 0 or indice >= len(denominaciones):
            continue

        denominacion = denominaciones[indice]
        max_veces = valor_actual // denominacion

        for veces in range(max_veces + 1):
            nuevo_comb = combinacion + [denominacion] * veces
            nuevo_valor = valor_actual - denominacion * veces
            list_comb.append((nuevo_valor, indice + 1, nuevo_comb))

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