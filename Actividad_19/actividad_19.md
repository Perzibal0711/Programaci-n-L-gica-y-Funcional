# El acertijo del pez: solución paso a paso

En una calle hay cinco casas, cada una de un color distinto. En cada casa vive una persona de nacionalidad diferente. Cada dueño bebe un único tipo de bebida, fuma una sola marca de cigarrillos y tiene una mascota distinta a la de sus vecinos. Con las 15 pistas siguientes hay que responder: **¿quién es el dueño del pez?**

> **Nota de adaptación:** en la tabla de solución la casa blanca es la 4 y la verde la 5, y el café se bebe en la 4. Por eso las pistas 6 y 7 están adaptadas: la blanca queda a la izquierda de la verde, y el café lo bebe el dueño de la casa blanca. El resto de las pistas se mantiene igual.

## Las 15 pistas

1. El británico vive en la casa roja.
2. El sueco tiene un perro como mascota.
3. El danés toma té.
4. El noruego vive en la primera casa.
5. El alemán fuma Prince.
6. La casa blanca está inmediatamente a la izquierda de la verde.
7. El dueño de la casa blanca bebe café.
8. El que fuma Pall Mall cría pájaros.
9. El dueño de la casa amarilla fuma Dunhill.
10. El hombre de la casa del centro bebe leche.
11. El que fuma Blends vive al lado del que tiene un gato.
12. El que tiene un caballo vive al lado del que fuma Dunhill.
13. El que fuma Bluemaster toma cerveza.
14. El que fuma Blends vive al lado del que toma agua.
15. El noruego vive al lado de la casa azul.

## Paso 1: lo que se coloca directamente

El noruego vive en la casa 1 (pista 4) y la casa del centro, la 3, bebe leche (pista 10). Como el noruego es vecino de la casa azul (pista 15) y la casa 1 solo tiene un vecino, la azul es la casa 2.

| Nacionalidad | Color | Casa | Bebida | Cigarrillos | Animal |
|---|---|---|---|---|---|
| Noruego | | 1 | | | |
| | Azul | 2 | | | |
| | | 3 | Leche | | |
| | | 4 | | | |
| | | 5 | | | |

## Paso 2: ubicar blanca y verde

La casa blanca debe estar justo antes de la verde. La casa 2 ya es azul, así que la pareja solo puede ser 3-4 o 4-5.

- Si la blanca fuera la 3, tendría que beber café (pista 7), pero la 3 bebe leche. Imposible.
- Por lo tanto, la blanca es la **4** (con café) y la verde la **5**.

Quedan el rojo y el amarillo para las casas 1 y 3. El británico vive en la roja y el noruego en la 1, así que la roja es la **3** y la amarilla la **1**.

| Nacionalidad | Color | Casa | Bebida | Cigarrillos | Animal |
|---|---|---|---|---|---|
| Noruego | Amarilla | 1 | | | |
| | Azul | 2 | | | |
| Británico | Roja | 3 | Leche | | |
| | Blanca | 4 | Café | | |
| | Verde | 5 | | | |

## Paso 3: Dunhill y el caballo

La casa amarilla fuma Dunhill (pista 9). El del caballo vive al lado del que fuma Dunhill y la casa 1 solo tiene un vecino, así que el **caballo** está en la casa 2.

| Nacionalidad | Color | Casa | Bebida | Cigarrillos | Animal |
|---|---|---|---|---|---|
| Noruego | Amarilla | 1 | | Dunhill | |
| | Azul | 2 | | | Caballo |
| Británico | Roja | 3 | Leche | | |
| | Blanca | 4 | Café | | |
| | Verde | 5 | | | |

## Paso 4: ¿dónde fuma Blends?

El que fuma Blends tiene un vecino que bebe agua. Probamos cada casa posible (la 1 ya es de Dunhill):

- **Blends en la 5:** su único vecino es la casa 4, que bebe café, no agua. Descartado.
- **Blends en la 4:** el agua tendría que estar en la 3 o la 5. La 3 bebe leche, así que sería la 5. Entonces té y cerveza quedan para las casas 1 y 2. El fumador de Bluemaster bebe cerveza y la casa 1 fuma Dunhill, así que la cerveza es de la 2 y el té de la 1. Pero el té es del danés y en la 1 vive el noruego. Descartado.
- **Blends en la 3:** el agua tendría que estar en la 2 (la 4 bebe café). Entonces té y cerveza quedan para las casas 1 y 5. El danés bebe té y no vive en la 1, así que el té es de la 5 y la cerveza de la 1, pero la 1 fuma Dunhill y la cerveza va con Bluemaster. Descartado.
- **Blends en la 2:** es la única opción que sobrevive.

Con Blends en la 2, el agua debe estar en la casa 1 (la 3 bebe leche). El té y la cerveza quedan para las casas 2 y 5, y como la 2 fuma Blends (no Bluemaster), la **cerveza** es de la 5 con **Bluemaster**, y el **té** de la 2, donde vive el **danés**.

| Nacionalidad | Color | Casa | Bebida | Cigarrillos | Animal |
|---|---|---|---|---|---|
| Noruego | Amarilla | 1 | Agua | Dunhill | |
| Danés | Azul | 2 | Té | Blends | Caballo |
| Británico | Roja | 3 | Leche | | |
| | Blanca | 4 | Café | | |
| | Verde | 5 | Cerveza | Bluemaster | |

## Paso 5: Prince, Pall Mall y los pájaros

Solo quedan Pall Mall y Prince para las casas 3 y 4. El alemán fuma Prince y el británico (casa 3) no es alemán, así que **Prince** va en la 4 con el **alemán**, y **Pall Mall** en la 3, con sus **pájaros**.

## Paso 6: gato, perro y pez

El que fuma Blends (casa 2) vive al lado del gato. La casa 3 ya tiene pájaros, así que el **gato** está en la casa 1.

Quedan el sueco y las mascotas perro y pez. El sueco no puede vivir en la 4 (allí vive el alemán), así que vive en la 5 con su **perro**.

La única mascota que sobra es el pez, y pertenece a la casa 4.

## Tabla final

| Nacionalidad | Color | Casa | Bebida | Cigarrillos | Animal |
|---|---|---|---|---|---|
| Noruego | Amarilla | 1 | Agua | Dunhill | Gato |
| Danés | Azul | 2 | Té | Blends | Caballo |
| Británico | Roja | 3 | Leche | Pall Mall | Pájaros |
| Alemán | Blanca | 4 | Café | Prince | Pez |
| Sueco | Verde | 5 | Cerveza | Bluemaster | Perro |

**Resultado: el dueño del pez es el alemán.**