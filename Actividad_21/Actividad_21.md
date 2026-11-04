# Funciones propias del lenguaje Prolog.
## Sintaxis de Prolog
**Operadores Logicos**

Suma : +
Resta : -
Division : /
Division de esnteros (truncadas) : //
Resto de division : mod
Potencia : **

**Operadores Logicos**

Negacion : not
No probable : \+
Conjuncion Logica : ,
Disjuncion Logica : ;
Implicacion Logica : :-
if-then-else : ->

**Operador Is**

Es un operador infijo, que en la parte de la derecha lleva un termino que se interpreta como una expresion aritmetica, y la constannte es el termino a la izquierda.

- Ejemplo: La expresion 6 is 4 + 3 es falso, por otra parte X is 4 + 3, el resultado de X = 7. 

**SP Reglas (cond)**

Es un predicado especial de reglas condicionales. Estos son predicados especiales que se utilizan en las reglas de prolog para expresar ciertas condiciones y restricciones. Los SP Regla(cond) se utilizan para mejorar la eficiencia y la capacidad de expresion de las reglas de Prolog.

- Cut(!): Se utiliza para eliminar soluciones ennecesarias en una regla. El simbolo de corte ! se coloca en la regla justo despues de una condicion, y le indica a prolog que una vez que encunetra una solucion, no busca mas soluciones que cumplan la misma condicion

- Fail(+): Se utiliza para expresar que una condicion no es cierta. El simbolo de fail se coloca antes de una condicion y le indica a Prolog que la regla solo se aplica cuando la condicion no se cumple.

Nota(->): Se utiliza para expresar una condicion que debe cumplirse antes de aplicar una regla. El simbolo de nota se coloca antes de una condicion, y despues se escribe la regla que se aplicara si se cumple la condicion.

**Backtracking**

Se refiere a la capacidad del lenguaje de programacion para retroceder en su busqueda de soluciones cuando encuentra una solucion incorrecta o incompleta. Prolog utiliza la estrategia de busqueda de "primero en profundidad" para buscar soluciones, y el backtraking permite que el programa explore multiples soluciones posibles

- Regla para sumar dos numerosy obtener un tercero

    suma(X,Y,Z):-Z is X + Y

**Fallo (Failure)**

El fallo se refiere a la situacion en la que le interprete de Prolog no puede encontrar ninguna solucion para una consulta.

**Unificacion**

Dados dos terminos, se dice que unifican si:
- son identicos, o
- Las variables de los dos terminos se pueden instanciar a objetos de manera que los dos terminos lleguen a ser identicos.
- Ejemplo: date(D,M,2001) date(D1,mayo,A1), D = D1, M = Mayo, A1 = 2001

Las reglas generales de la unificaion son:

- Si S y T son constantes, han de ser el mismo objeto.
- Si S es una variable y T es cualquier cosa, unifican (S se instancia a T); y viceversa.
- Si S y T son estructuras, unifican siempre y cuando: el nombre del functor sea el mismo y todos sus atributos unifican.

**Listas**

Una lista es una secuencia de elementos (atomos, estructuras, listas), se representan entre corchetes: [juan, tenis], una lista vacia se representa con [].

La representacion interna es con una estructura llamada "." con dos elementos: cabeza y cola: .(juan .(tenis, .(carlos, .(futbol, [])))), la cola de toda lista puede ser otra lista, usando el functor "."

Se puede especificar explicitamente la separacion entre cabeza y la cola, mediante la cabeza y la cola, mediante una barra vertical.

**Operaciones con listas**

- Miembros de una lista: miembro(X, [X|Tail]). , miembro(X, [Head|Tail]):- miembro(X, Tail).

- Concatenacion: conc([], L, L). ,  conc([X|L1], L2, [X|L3]):- conc(L1,L2,L3).



