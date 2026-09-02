def division(n, r, cont=0):
    if (n < r):
        return cont
    else:
        return division(n - r, r, cont + 1)

def main():
    divisor = int(input("Ingrese el divisor: "))
    dividendo = int(input("Ingrese el dividendo: "))
    resultado = division(divisor, dividendo)
    print(f"El resultado de dividir {divisor}/{dividendo} es: {resultado}")

if __name__ == "__main__":
    main()