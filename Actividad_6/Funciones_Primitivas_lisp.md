# Funciones  primitivos de Lisp

**Realizar una investigacion sobre las funciones primitivas que yiene "Lisp" y hacer un documento markdown en el cual se describan el funcionamiento de minimo 25 funciones, agregando un ejemplo de su funcionamiento.**

## Funciones en Lisp

### 1. Estructura de las funciones.

Las funciones de Lisp se escriben siempre de la siguiente forma general:

*`(nombre arg1 arg2 ...)`*

***nombre ->*** identifica a la funcion
***arg1, arg2, ...->*** son los argumentos a los que se aplica la funcion.

Las funciones pueden anidarse arbitrariamente, en cuyo caso se evalula de `dentro a fuera` Por ejemplo.

*`(+ (* 2 3) 4)`*

Ademas, una lista de funciones se evalua de izquierda a derecha. Por ejemplo.

*`(- (+ 2 3) (* 3 4))`*

### 2 Funciones Aritmeticas
#### 2.1 Suma -> +

Funcion -> Sumar cantidades o numeros.

```
Ejemplo de uso:

(+ 5 2 4)       => 11
(+ 1.5 3.7)     => 5.2
```

#### 2.2 Resta -> -
Funcion -> Restar cantidades o numeros.

```
(- 10 3)    => 3
(- 10 2 1)  => 7
(-5)        => -5 (negacion)
```
#### 2.3 Multiplicacion -> *

Funcion -> Multiplicar cantidades o numeros.

```
(/ 10 2)      => 5
(/ 10 3)      => 10/3
(/ 10.0 3)    => 3.3333333
```

#### 2.4 Division -> /

Funcion -> Dividir cantidades o numeros.

```
(/ 10 2)     => 5
(/ 10 3)     => 10/3
(/ 10.0 3)   => 3.3333333
```

#### 2.5 Exponentes -> expt

Funcion -> Calcula potencias elevadando su primer argumento a su segundo.

```
(expt 2 3)     => 8
(expt 9 0.5)   => 3.0 (raíz cuadrada)
```

#### 2.6 Raices -> sqrt

Funcion -> Calcula raices cuadradas. 

```
(sqrt 16)         => 4.0
(sqrt 2)          => 1.4142135
```

#### 2.7 Valor Absoluto -> abs

Funcion -> Calculael valor absoluto.

```
(abs -5)            => 5
(abs 3.14)          => 3.14
```

#### 2.8 Modulo -> mod

Funcion -> Calcula el resto de una division.

```
(mod 7 3)          => 1
(mod 10 4)         => 2
```

#### 2.9 Maximo y Minimo -> max, min

Funcion -> Devuelve el malor maximo o minimo de una lista.

```
(max 23 3 5 234 645)    => 645
(min 23 3 456 46)       => 3
```

#### 2.10 Flotante -> float

Funcion -> Devuelve el valor como flotante.

```
(float (/ 22 7))    => 3.1428
(float (/ 5 2))     => 2.5
```
#### 2.11 Redondear -> round

Funcion -> Redondea un valor al entero mas cercano.

```
(round (/ 22 7))    => 3
```

#### 2.12 Random -> random

Funcion -> Calcula el numero aleatorio de 0 a N-1.

```
(random 10)     => 0, 1, 2, 3, ..., 9
```

### 3 Comparacion

#### 3.1 Igualdad Numerica -> =

Funcion -> Compara una igualdad de numeros.

```
(= 5 5)             => T (True)
(= 5 6)             => NIL (Falso)
(= 5 5.0)           => T (True)
```

#### 3.2 Menor que -> <

Funcion -> Verifica si una cantidad es menor.

```
(< 3 5)             => T
(< 1 2 3 4)         => T (orden ascendente)
```

#### 3.3 Mayor que -> >

Funcion -> Verifica si una cantidad es mayor.

```
(>= 5 5)            => T
(>= 7 5 3)          => T
```

#### 3.4 Diferente -> /=

Funcion -> Verifica si son difentes las cantidades

```
(/= 5 6)            => T
(/= 5 5)            => NIL
```
#### 3.5 Igualdad -> equal

Funcion -> Evalua si el valor de dos argumentos es la misma expresion

```
(equal (+ 2 3) 4)       => T
(equal '(x y) '(x y))   => T
```
#### Igualdad -> eql

Funcion -> Evalua si el valor de dos argumentos es el mismo simbolo o numero por su identidad o valor

```
(eql 5 5)       => T
(eql 5 6)       => NIL
(eql 'x 'x)     => T
```
#### Igualdad -> eq

Funcion -> Evalua si el valor de los dos argumentos es el mismo simbolo.

```
(eq 'x 'x)      => T
(eq 'x 'y)      => NIL
```

### 4 Funciones de listas en CLISP

#### 4.1 Primer Elemento -> car

Funcion -> Extre el primer elemento de una lista.

```
(car '(1 2 3 4))        => 1
(car '((a b) c d))      => (A B)
(car '())               => NIL
```

#### 4.2 Resto de la lista -> cdr

Funcion -> Obtiene todos los elementos excepto el primero.

```
(cdr '(1 2 3 4))        => (2 3 4)
(cdr '(solo))           => NIL
```

#### 4.3 Construccion de listas -> cons

Funcion -> Construye listas uniendo elementos. Inserta un nuevo elemnto en la primera posicion de una lista.

```
(cons 1 '(2 3 4))       => (1 2 3 4)
(cons 'a '(b c))        => (A B C)
```

#### 4.4 Creacion de listas -> list

Funcion -> Crea una nueva lista con los elementos dados.

```
(list 1 2 3 4)          => (1 2 3 4)
(list 'a 'b 'c)         => (A B C)
```

#### 4.5 Longitud de listas -> length

Funcion -> Calcula el numero de elementos de una lista.

```
(length '(1 2 3 4))     => 4
(length '())            => 0
```

#### 4.6 Concatenacion de listas -> append 

Funcion -> Une multiples listas en una sola lista.

```
(append '(1 2) '(3 4))          => (1 2 3 4)
(append '(a) '(b c) '(d e f))   => (A B C D E F)
```

#### 4.7 Invertir listas -> reverse

Funcion ->  Invertir el orden de los elementos.

```
(reverse '(1 2 3 4))    => (4 3 2 1)
(reverse "hola")        => "aloh"
```

#### 4.8 Elemento en posicion -> nth

Funcion -> Obtiene el elemento en la posicion n.

```
(nth 0 '(a b c d))      => A
(nth 2 '(a b c d))      => C
(nth 5 '(a b c))        => NIL
```

#### 4.9 Accesores de lista -> first, second, etc

Funcion -> Acceden a elementos especificos de una lista.

```
(first '(a b c d))      => A (equivale a CAR)
(second '(a b c d))     => B
(third '(a b c d))      => C
```

#### 4.10 Ultimo elemento -> last

Funcion -> Retorna el ultimo cons de la lista.

```
(last '(1 2 3 4))       => (4)
(car (last '(1 2 3 4))) => 4
```

#### 4.11 Buca miembros -> member

Funcion -> Busca un elemento en la lista.

```
(member 'b '(a b c d))  => (B C D)
(member 'x '(a b c d))  => NIL
```

#### 4.12 Remover elementos -> remove

Funcion -> Remueve elementos de la lista.

```
(remove 'b '(a b c b d))    => (A C D)
(remove 2 '(1 2 3 2 4))     => (1 3 4)
```

### 5 Funciones Logicas

#### 5.1 Operador logico and -> and

Funcion -> Retorna T si todos los valores son verdaderos.

```
(and t t t)         => T
(and t nil t)       => NIL
```

#### 5.2 Operador logico or -> or

Funcion -> Retorna T si alguno es verdadero.

```
(or nil nil t)      => T
(or nil nil nil)    => NIL
```

#### 5.3 Negacion logica -> not

Funcion -> Invierte el valor logico.

```
(not t)             => NIL
(not nil)           => T
```

### 6 Funciones de definicion

#### 6.1 Definicion de funciones -> defun

Funcion -> Define nuevas funciones.

```
(defun suma (a b)
  "Suma dos números"
  (+ a b))

(suma 5 3)              => 8
```

#### 6.2 Variables globales -> defvar

Funcion -> Define variables globales (no reinicializa si ya existe).

```
(defvar *contador* 0 "Contador global")
(defvar *lista-usuarios* '())
```

#### 6.3 Parametros globales -> defparameter

Funcion -> Define parametros globales (siempre reinicializa).

```
(defparameter *version* "1.0.0" "Versión del sistema")
(defparameter *debug-mode* t)
```

#### 6.4 Constantes -> defconstant

Funcion -> Define constantes inmutables.

```
(defconstant +pi+ 3.14159 "Valor de Pi")
(defconstant +max-size+ 100)
```

### 7 Funciones de variables y asignacion

#### 7.1 Asignacion general -> setf

Funcion -> Asigna o modifica valores a variables o una parte de una estructura de datos.

```
(defvar *x*)
(setf *x* 42)           *x* ahora es 42
(setf *a* 10 *b* 20)    múltiples asignaciones
```

#### 7.2 Asignacion de variables -> setq

Funcion -> Asigna valores a una variables.

```
(setq nueve '9)
(setq l '(a b c))
```

#### 7.3 variables locales -> let

Funcion -> Crea un ambito local con variables temporales.

```
(let ((x 10)
      (y 20))
  (+ x y))      => 30
```

#### 7.4 Variables locales secuenciales -> let*

Funcion -> Variables locales que pueden depender de anteriores.

```
(let* ((x 5)
       (y (* x 2))
       (z (+ x y)))
  z)                    => 15
```

#### 7.5 Incrementar variables -> incf

Funcion -> Incrementa el valor de una variable.

```
(defvar *contador* 5)
(incf *contador*)           *contador* ahora es 6
(incf *contador* 3)         *contador* ahora es 9
```

### 8 Funciones de control de flujo

#### 8.1 Condicional simple -> if

Funcion -> Ejecuta codigo basandose en condiciones.

```
(if (> 5 3)
    "Cinco es mayor"
    "Esto no ocurre")      => "Cinco es mayor"
```

#### 8.2 Condicional de una rama -> when 

Funcion -> Ejecuta multiples expresiones si es verdad.

```
(when (> 5 3)
  (print "Es verdadero")
  "Valor retornado")
```

#### 8.3 Condicional negativa -> unless

Funcion -> Ejecuta condigo si la condicion es falsa.

```
(unless (< 5 3)
  "Cinco NO es menor")  => "Cinco NO es menor"
```

#### 8.4 Condicional multiple -> cond

Funcion -> Maneja multiples condicionales.

```
(cond ((> x 0) "positivo")
      ((< x 0) "negativo")
      (t "cero"))
```

#### 8.5 Seleccion de valor -> case

Funcion -> Selecciona codigo basandose en valor.

```
(case dia
  (1 "Lunes")
  (2 "Martes")
  ((6 7) "Fin de semana")
  (otherwise "Día inválido"))
```

**Documentacion de funciones primiticas de lisp.**

[Enlaces de comandos](https://github.com/AdrianLoezaZeped/Programacion-Logica-y-Funcional/blob/main/Funciones%20de%20CLISP.md).

[Enlaces de comandos](https://www.davidam.com/software/primitivas.html)