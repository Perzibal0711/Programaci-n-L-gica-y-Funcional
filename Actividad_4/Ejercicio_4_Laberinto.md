# Ejercicio 4 - Recorrido del Laberinto

**Instrucciones**
 
 Recorrer un laberinto utilizando hasta llegar a la meta utilizando backtracking hasta llegar a la meta.

 ## Desarrollo

 Para buscar el recorrido que permite llegar desde el punto de origen hasta la meta se utilizo recursividad, utilizando un recorrido parecido al que se utiliza para recorrer arboles binarios, siendo en este caso el recorrido de un laberinto con cuatro posibles recorridos siendo cuando de mueve hacia arriba, abajo, a la derecha o izquierda `(y-1, x), (y+1, x), (y, x+1), (y, x-1)` respectivamente.

 Donde al encontrar algun muro, salirse fuera del rango o regresar a algun a una casilla ya recorrida, se mueve en otra direccion o regresa a un estado anterior `backtracking` para de esta forma buscar otro camino que lo guie directo a la meta. Asi mismo utiliza recursividad para buscar entre los posibles caminos.

 Para poder desarrollar el codigo y buscar mas el camino que permita resolver el laberinto se utilizo una funcion llamada `recorrer()` la cual recibe 4 parametros, siendo `l` el laberinto, `c` un arreglo que almacena el camino valido que lleva a la meta, y las posiciones `x` y` y` que manejan las posiciones donde nos encontramos al recorrer el laberinto.

 Siendo asi que dentro de la funcion se tiene varios casos base que tiene diferentes funciones dentro de los cuales se encunetra el que indica si la nueva posicion a la que nos vamos a desplzar se encuentra dentro de los limites del laberinto, lo cual permite que identificar si la nueva posicion esta fuera de rango, en donde si esto es verdadero se retornara `None` lo cual indicara que no se puede ir en esa direccion y se initentara realizar un recorriedo en otra de las posibles direcciones.

 ```
    if y < 0 or y >= len(l) or x < 0 or x >= len(l[0]):
    return None
 ``` 

 Tambien se tiene el caso base cuando se llega a la meta lo cual indicaria que se llego a la meta y que se tiene el recorrido completo, lo cual agregaria al arreglo que tiene el recorrido del laberinto `c` la posicion de la meta y a su vez regresaria el arreglo del recorrido finalizando la ejecucion del mismo.

```
    if l[y][x] == "M":
        c.append([y, x])
        return c
```

Otro de los casos base es cuando la posicion de recorrido esta dentro de los limites permitidos, y no se ha llegado a la meta, en donde se tiene el caso base de que si la nueva posicion es diferente de `0` lo cual indicaria que es un espacio que no esta libre para moverse. Esto es devido a que para encontrar el camino uno debe moverse por las casillas que tengan un valor igual a `0`, donde si no recumple la condicion se regresa un `None` y se se ahce el recorrido hacia una direccion diferente.

```
    if l[y][x] != 0:
        return None
```

En caso de que pase las condicienes antes descritas se realizan dos cosas una es que al valor actual se le asigan el nuevo valor de  `X`, lo cual indica que esa casilla ya fue recorrida, evitando asi un bucle infinito, asi mismo al arreglo `c`, se le agrega las cordenadas de la nueva posicion valida. Despues se entra a un ciclo for que permite recorrer el laberinton en las 4 posibles direcciones antes mensionadas, asi mismo si el resultado es difenrete de `None` indicara que la direccion en la que se esta recorriendo el laberinto es valida, caso contrario, indocara que no es valida y se utilizara alguno de los otros movimientos validos.

```
    l[y][x] = "x"
    c.append([y, x])

    for ny, nx in [(y-1, x), (y+1, x), (y, x+1), (y, x-1)]:
        resultado = recorrer(l, c, ny, nx)

        if resultado is not None:
            return resultado
```

Por ultimo se tiene el `backtracking` el cual indica que se hicieron los cuatro posibles recorridos validos, en donde si se llego a una posicion que no es valida regresa a la anterior hasta encontrar una valida, asi mismo elimina la cordena antes recorrida regresandola a su valor original de `0` y retorna un `None` lo cual indica que no es un camino valido.

```
    #backtracking
    c.pop()
    l[y][x] = 0

    return None
```
## Resuultado

Para comprobar el funcionameinto del programa se tiene una matriz que representa un laberinto, donde `0` es un camino libre, `1` es un muro y `M` es la meta.  

```
L = [
    [0,1,0,0,0,0,0,0],
    [0,1,1,1,1,0,1,0],
    [0,1,0,0,0,0,1,0],
    [0,0,0,1,1,0,1,0],
    [0,1,0,1,0,0,1,0],
    [0,1,0,0,0,0,1,"M"],
]
```
Al ejecutar el codigo se tiene la siguiente salida en la cual el camino que condice desde el inicio del laberindo que es la posicion `0,0` hasta la meta se representa con una `X`.

```
X 1 0 0 0 X X X 
X 1 1 1 1 X 1 X 
X 1 X X X X 1 X 
X X X 1 1 0 1 X 
0 1 0 1 0 0 1 X 
0 1 0 0 0 0 1 X 
```
