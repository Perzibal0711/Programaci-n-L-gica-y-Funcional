import numpy as np

def teselas(m, x = 0, y = 0):

    if y+2 > len(m) or x+2 > len(m[0]):
        cont = np.count_nonzero(m == 0)
        if cont == 1:
            return m
        else:
            return None

    m_2x2 = m[y:y+2, x:x+2]

    if y + 3 < len(m):
        res_m = f_a(m_2x2)
    else:
        res_m = f_b(m_2x2)

    if res_m is not None:
        m[y:y+2, x:x+2] = res_m

    if x < len(m[0])-2:
        return teselas(m, x + 1, y)
    else:
        return teselas(m, 0, y + 1)
    
def f_a(m, f = False , t = [[2,2],
                            [0,2]]):
    if m[0][0] == 0 and m[0][1] == 0 and m[1][1] == 0:
        m[0][0] = t[0][0]
        m[0][1] = t[0][1]
        m[1][1] = t[1][1]
        return m
    elif f:
        return None
    else:
        return f_b(m , True)

def f_b(m, f = False, t = [[1,0],
                           [1,1]]):
    if m[0][0] == 0 and m[1][0] == 0 and m[1][1] == 0:
        m[0][0] = t[0][0]
        m[1][0] = t[1][0]
        m[1][1] = t[1][1]
        return m
    elif f:
        return None
    else:
        return f_a(m, True)
    
def main():
    m = np.zeros((8,8), dtype = int)
    m = teselas(m)
    if m is not None:
        for fila in m:
            print(" ".join(f"{num:3}" for num in fila))
    else:
        print("ERROR al acomodar las teselas")

if __name__ == "__main__":
    main()