def fibonacci(n):
    if (n<=1):
        return n
    else:
        return fibonacci(n-1) + fibonacci(n-2)

def main():
    valor = int(input("Ingrese el valor en la secuencia de fibocci que quiere conocer: "))
    resultado = fibonacci(valor)
    print(f"El valor en la secuencia fibonacci de {valor} es: {resultado}")

if __name__ == "__main__":
    main()