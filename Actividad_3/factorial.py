def factorial(n):
    if (n == 0):
        return 1
    else:
        return n * factorial(n-1)

def main():
    valor = int(input("Ingrese el valor del factorial que quiere conocer: "))
    resultado = factorial(valor)
    print(f"El valor del factorial de {valor} es: {resultado}")

if __name__ == "__main__":
    main()