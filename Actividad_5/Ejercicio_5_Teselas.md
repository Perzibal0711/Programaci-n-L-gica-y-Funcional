# Ejercicio 5 - Teselas

**Instrucciones**
 
 Llenar una matrix de 8x8 utilizando teselas, en donde deben acomodarse de tal menera que solo quede un espacio libre.

 ```
    Teselas

   a.-   ____    b.-  __ 
        |_   |       |  |_ 
          |__|       |____| 
 ```

 ## Desarollo

 Para poder solucionar el problema se utilizo recursividad, utilizando 3 funciones, la primera funcion es `def teselas()` la cual es la funcion principal que realiza el recorrido de la matriz y maneja la recursividad principal. Las otras dos funciones son `def f_a()` y `def f_b()` las cuales manejan el acomodo de las teselas.

 El funcionamiento principal del programa consiste en dividir la matriz de 8x8 en una matriz mas pequeña de 2x2, en la cual se realiza una acomodo de las teselas en relacion a su forma, en donde empieza acomodando las teselas de la forma `a`, y sigue acomodando de esa forma hasta que no sea posible utilizar esa forma y cambia la a `b`, y esto lo va haciendo sucesivamente hasta llenar toda la matriz y dejar solo un espacio disponible.

 La funcion principal recibe 3 parametros importantes siendo `m` la matiz de 8x8, y los parametros `x` y `y` que representan las cordenadas de la posicion en la que nos encontramos.

Como caso base dentro de la funcion principal se tiene que cuando `y+2` sea mayor a la longitud de las filas de la matriz y `x+2` sea mayor a las columnas de la matriz se abra recorrido por completo la matriz 8x8, y se realizara la comprobacion en donde se hara la comprobacion de que la matriz esta llena de teselas y solo se tiene 1 espacio disponible, donde si se cumple la condicion retornara la matriz `m` llena de teselas, y en caso contrario retornara un `None` lo cual indicara que no se puedo llenar a matriz.  

```
    if y+2 > len(m) or x+2 > len(m[0]):
        cont = np.count_nonzero(m == 0)
        if cont == 1:
            return m
        else:
            return None
```

Despues de comprobar si se cumple el caso caso se tiene la logica para poder colocar las teselas en cada una de las pocicion en donde primero de la matriz de 8x8, se genera una mtriz mas pequeña de 2x2, una vez obtenida la matriz se ejecuta un condicional con el cual se decibe la figura que se utilizara, la condificion principlamente permite indicar si se utilizara la tesela `a` o `b`, donde si la longitud de `y + 3` es mayor la alongitud de las filas indica que el acomodo debe empezar utilizando la tesela `b`, de lo contrario se utilizara la `a`.

Una vez acomodada la tesela de 2x2, esta se integra a la matriz de 8x8, locual permite avanzar una posicion con las cordenas `x` y `y` utilizando un `if`, en el cual siempre y cuando `x` sea menor a la longitud de la columna actual se movera en 1, miestras que si se cumple la condicion avanzara a la fila siguiente y las columnas se actualizaran para que empieze en `0` nuevamente. Esto mientra se hacen llamdas recursivas hasta llegar al caso base.

```
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
```

Por ultimo se tienen las funciones `f_a()` y `f_b()` las cuales reciben los mismos paramtros, siendo `m` la matriz 2x2, y un parametro `f` el cual ayuda a mantener un control y permite indicar si ya se utilizo esa tesela mas de una vez, lo cual permite evitar un recursividad infinita, ya que funciona como uno de los casos base posibles. Por ultimo la funcion recibe el paramtro `t` el cual tiene la tesela a utilizar ya sea la `a` o `b` respectivamente para cada funcion.

Dentro de ambas funciones se tiene una condicional en la cual compara los valores de la matriz 2x2 mandada con los valores de la tesela a usar donde si la tesela encaja en la matriz correctamente, se guarda la tesela en la matrix y se retorna. miestras que si no encaba la tesela en la matriz dada se intenta utilizando la otra tesela, lo cual quiere decir que si la primera opcion es utilizar la tesea `a` y esta no encaja se utilizara la tesela `b` y asi al contrario, siendo asi que al utilizar la tesela contraria se manda como parametro un `True` lo cual indicaria que ya se utilizaron las dos teselas y evitaria entrar en una recursividad infinita, ya que al indicar que se utilizaron las dos posibles variables y ninguna es factible se retornara un `None`.

```
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
```

## Resultados

En esta prueba su tilizo el numero dos para representar las teselas `a` mientras que se utilizo el numero uno para represerentar a las teselas `b`, para indicar los espacios libres se utizo el cero, de esta manera se puede apreciar de manera mas clara cuando se utilizo cada tesela y asi mismo donde quedo el espacio vacio.

```
  2   2   2   2   2   2   2   2
  1   2   1   2   1   2   1   2
  1   1   1   1   1   1   1   1
  2   2   2   2   2   2   2   2
  1   2   1   2   1   2   1   2
  1   1   1   1   1   1   1   1
  1   2   2   1   2   2   1   0
  1   1   2   1   1   2   1   1
```