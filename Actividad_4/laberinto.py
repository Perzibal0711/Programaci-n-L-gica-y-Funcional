L = [
    [0,1,0,0,0,0,0,0],
    [0,1,1,1,1,0,1,0],
    [0,1,0,0,0,0,1,0],
    [0,0,0,1,1,0,1,0],
    [0,1,0,1,0,0,1,0],
    [0,1,0,0,0,0,1,"M"],
]

def recorrer(l, c=None, y=0, x=0):

    if c is None:
        c = []

    if y < 0 or y >= len(l) or x < 0 or x >= len(l[0]):
        return None

    if l[y][x] == "M":
        c.append([y, x])
        return c

    if l[y][x] != 0:
        return None

    l[y][x] = "x"
    c.append([y, x])

    for ny, nx in [(y-1, x), (y+1, x), (y, x+1), (y, x-1)]:
        resultado = recorrer(l, c, ny, nx)

        if resultado is not None:
            return resultado
    
    #backtracking
    c.pop()
    l[y][x] = 0

    return None

def main():

    recorrido = recorrer(L)

    r = L

    for ny, nx in recorrido:
        r[ny][nx] = "X"

    for fila in r:
        for elemento in fila:
            print(elemento, end=" ")
        print()

if __name__ == "__main__":
    main()