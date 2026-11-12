# Eliza: la parte de familia (`flagFam`) en el archivo Prolog

Este documento explica todo lo que el archivo `eliza.pl` contiene sobre la familia: los datos que usa, los templates, la cláusula de `replace0`, los predicados de apoyo, las reglas de parentesco y, al final, el recorrido paso a paso de una consulta.

---

## 1. Datos que usa la familia

La familia se describe con cinco tipos de hechos:

| Hecho | Significado | Ejemplo |
|-------|-------------|---------|
| `padre(X)` | X es un padre | `padre(anselmo_ramirez).` |
| `madre(X)` | X es una madre | `madre(petra_flores).` |
| `padrede(P, H)` | P es el padre de H | `padrede(anselmo_ramirez, teodoro_ramirez_flores).` |
| `madrede(M, H)` | M es la madre de H | `madrede(petra_flores, teodoro_ramirez_flores).` |
| `esposade(Esposa, Esposo)` | La esposa y el esposo | `esposade(petra_flores, anselmo_ramirez).` |

Los nombres son átomos con guiones bajos (`teodoro_ramirez_flores`). Las consultas y las reglas se apoyan en `padrede`, `madrede` y `esposade`. Los hechos `padre/1` y `madre/1` son solo listas informativas y ninguna regla los consulta.

---

## 2. Cómo llega una frase a la parte de familia

### 2.1 El ciclo principal

`eliza/1` recibe la frase ya convertida en lista de palabras por `readln`. Después de revisar si es una despedida, ejecuta:

```prolog
eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.
```

Se prueban los templates **en el orden en que están escritos en el archivo**. El primero que cumpla `match` y cuyo `replace0` tenga éxito produce la respuesta. Luego se imprime, se lee otra frase y el ciclo se repite.

Los templates de familia están después de los de saludo, gustos e información, y antes del template final de respaldo (`'Por favor, explica un poco mas.'`).

### 2.2 `match/2`

`match(Stim, Input)` compara el template con la frase:

```prolog
match([],[]).
match([], _):- true.
match([S|Stim],[I|Input]) :- atom(S), S == I, match(Stim, Input), !.
match([S|Stim],[_|Input]) :- \+atom(S), match(Stim, Input), !.
```

- Una palabra del template (átomo) debe ser **idéntica** a la palabra de la frase.
- Una variable o `s(_)` (no es átomo) acepta **cualquier** palabra en esa posición.
- Cuando el template se termina (`[]`), el resto de la frase se acepta sin importar lo que contenga.

Esa última regla permite que una frase traiga palabras extra al final, como el `?`.

---

## 3. Templates de familia

```prolog
template([que, familiares, tiene, s(_)],              [flagFam], [3]).
template([quien, es, el, padre, de, s(_)],            [flagFam], [5]).
template([quien, es, la, madre, de, s(_)],            [flagFam], [5]).
template([quienes, son, los, padres, de, s(_)],       [flagFam], [5]).
template([quienes, son, los, hijos, de, s(_)],        [flagFam], [5]).
template([quienes, son, los, hermanos, de, s(_)],     [flagFam], [5]).
template([quienes, son, los, primos, de, s(_)],       [flagFam], [5]).
template([quienes, son, los, tios, de, s(_)],         [flagFam], [5]).
template([quienes, son, los, sobrinos, de, s(_)],     [flagFam], [5]).
template([quienes, son, los, abuelos, de, s(_)],      [flagFam], [5]).
template([quienes, son, los, nietos, de, s(_)],       [flagFam], [5]).
template([quienes, son, los, bisabuelos, de, s(_)],   [flagFam], [5]).
template([quienes, son, los, bisnietos, de, s(_)],    [flagFam], [5]).
template([quienes, son, los, tatarabuelos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, tataranietos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, suegros, de, s(_)],      [flagFam], [5]).
template([quienes, son, los, nueros, de, s(_)],       [flagFam], [5]).
```

Cada template tiene tres partes:

1. **El patrón**: las palabras que debe tener la frase. `s(_)` marca el lugar del nombre.
2. **La respuesta**: siempre `[flagFam]`. Es solo una bandera que indica que la respuesta se calcula con la base de familia.
3. **La lista de índices**: la posición del nombre en la frase, contando desde 0. En `quien es el padre de teodoro` el nombre es la palabra número 5 (`quien`=0, `es`=1, `el`=2, `padre`=3, `de`=4, `teodoro`=5). En `que familiares tiene maria` el nombre es la número 3.

Como la bandera es la misma para todos, el template no dice qué relación se consulta. Eso se averigua después, a partir de las palabras de la frase.

Los templates no terminan con `_`. Gracias a la regla de `match` que acepta cualquier resto, la frase vale con o sin `?` al final.

---

## 4. La cláusula `replace0` de familia

```prolog
replace0([I|_], Input, _, Resp, R):-
	nth0(0, Resp, X),
	X == flagFam,
	!,
	dividir(I, Input, Pre, Nombre),
	relacion(Pre, Rel),
	elizaFam(Rel, Nombre, R).
```

Línea por línea:

- `nth0(0, Resp, X), X == flagFam`: verifica que la respuesta del template sea la bandera de familia. Si el template es de otra bandera, esta cláusula falla y se prueba la siguiente.
- `!`: una vez confirmada la bandera, no se prueban los `replace0` genéricos de más abajo.
- `dividir(I, Input, Pre, Nombre)`: separa la frase en dos partes. `Pre` son las palabras anteriores a la posición `I` y `Nombre` es el nombre armado con todas las palabras desde `I` hasta el final.
- `relacion(Pre, Rel)`: obtiene la relación que se pregunta, buscándola solo en las palabras de `Pre`.
- `elizaFam(Rel, Nombre, R)`: calcula la respuesta `R`.

Esta cláusula sigue la misma idea que las de `flagLike`, `flagDo` y `flagIs` (bandera, dato de la frase, predicado de respuesta). Las diferencias son que familia tiene muchas relaciones, por eso `relacion/2`, y que el nombre puede ocupar varias palabras, por eso `dividir/4`.

El nombre puede escribirse de tres formas y todas llegan igual a `elizaFam`:

| Se escribe | `Nombre` queda como |
|-----------|---------------------|
| `andres` | `andres` |
| `andres_vidal` | `andres_vidal` |
| `andres vidal` | `andres_vidal` |

---

## 5. Predicados de apoyo

### 5.1 `relPalabra/2`

```prolog
relPalabra(familiares, todos).
relPalabra(padre,      padre).
relPalabra(madre,      madre).
relPalabra(padres,     padres).
relPalabra(hijos,      hijos).
...
```

Tabla que convierte una palabra de la frase en el nombre de la relación. Hay una entrada por cada template. La palabra `familiares` se convierte en `todos`, que significa "mostrar todos los familiares".

### 5.2 `palabraNombre/1` y `dividir/4`

```prolog
palabraNombre(W):- atom(W), \+ member(W, ['?', '.', ',', '!']).

dividir(I, Input, Pre, Nombre):-
	length(Pre, I),
	append(Pre, Resto, Input),
	include(palabraNombre, Resto, Palabras),
	maplist(downcase_atom, Palabras, Min),
	atomic_list_concat(Min, '_', Nombre).
```

`dividir/4` separa la frase en dos partes usando el índice del template:

1. `length(Pre, I)` y `append(Pre, Resto, Input)` cortan la lista: `Pre` son las `I` primeras palabras y `Resto` el final de la frase, desde el nombre.
2. `include(palabraNombre, Resto, Palabras)` descarta los signos de puntuación (`?`, `.`, `,`, `!`), de modo que `?` no se confunda con parte del nombre.
3. `maplist(downcase_atom, ...)` pasa todo a minúsculas.
4. `atomic_list_concat(Min, '_', Nombre)` une las palabras con guiones bajos.

Ejemplos con el template `[quienes, son, los, hijos, de, s(_)]` (índice 5):

| Frase | `Pre` | `Nombre` |
|-------|-------|----------|
| `quienes son los hijos de andres` | `[quienes,son,los,hijos,de]` | `andres` |
| `quienes son los hijos de andres_vidal ?` | `[quienes,son,los,hijos,de]` | `andres_vidal` |
| `quienes son los hijos de andres vidal ?` | `[quienes,son,los,hijos,de]` | `andres_vidal` |

### 5.3 `relacion/2`

```prolog
relacion(Palabras, Rel):- member(W, Palabras), relPalabra(W, Rel), !.
relacion(_, desconocida).
```

Recorre las palabras de `Pre` de izquierda a derecha y devuelve la relación de la **primera** que esté en `relPalabra`. Las demás (`quien`, `es`, `el`, `de`...) no están en la tabla y se ignoran. Si ninguna está, devuelve `desconocida`. Al buscar solo antes del nombre, una palabra del nombre nunca se confunde con una relación.

### 5.4 `persona/1`

```prolog
persona(X):- padrede(X,_) ; padrede(_,X) ; madrede(X,_) ; madrede(_,X)
           ; esposade(X,_) ; esposade(_,X).
```

Es verdadero para cualquier nombre que aparezca en `padrede`, `madrede` o `esposade`, en cualquier posición. Se define así porque hay personas que no figuran en `padre/1` ni `madre/1` (por ejemplo `jesus_ramirez_flores`) y que igual forman parte de la familia.

### 5.5 `candidato/2`

```prolog
candidato(N, N):- persona(N), !.
candidato(N, P):-
    atom_concat(N, '_', Pref),
    persona(P),
    sub_atom(P, 0, _, _, Pref).
```

Convierte lo que escribió el usuario en nombres reales de la base:

- **Primera cláusula**: si lo escrito es exactamente el nombre de una persona (`teodoro_ramirez_flores`), esa es la única candidata y el `!` detiene la búsqueda.
- **Segunda cláusula**: si no, busca a todas las personas cuyo nombre **comienza** con lo escrito seguido de `_`. Así `teodoro` encuentra a `teodoro_ramirez_flores` y `andres_ramirez` encuentra a `andres_ramirez_mendoza`.
- El guion bajo agregado evita coincidencias falsas: `maria` no encuentra a `mariana_soto`, porque `mariana_soto` no empieza con `maria_`.

### 5.6 `bonito/2`

```prolog
bonito(A, B):-
    atomic_list_concat(Partes, '_', A),
    atomic_list_concat(Partes, ' ', B).
```

Parte el átomo en los guiones bajos y lo une con espacios: `teodoro_ramirez_flores` queda como `teodoro ramirez flores`. Se usa solo para que las respuestas se lean mejor.

### 5.7 `relacionTodos/1`

```prolog
relacionTodos(X):- member(X, [padre, madre, hermanos, hijos, primos, tios,
    sobrinos, abuelos, nietos, bisabuelos, bisnietos, tatarabuelos,
    tataranietos, suegros, nueros]).
```

Define qué relaciones se revisan, y en qué orden, cuando se pregunta `que familiares tiene ...`.

### 5.8 `lista/3`

`lista(Relacion, Nombre, Lista)` devuelve a las personas que tienen esa relación con `Nombre`. Hay una cláusula por relación:

```prolog
lista(padre,    N, L):- setof(P, padrede(P,N), L).
lista(madre,    N, L):- setof(M, madrede(M,N), L).
lista(padres,   N, L):- setof(P, (padrede(P,N) ; madrede(P,N)), L).
lista(hijos,    N, L):- setof(H, (padrede(N,H) ; madrede(N,H)), L).
lista(hermanos, N, L):- setof(X, R^hermanode(X,N,R), L).
lista(primos,   N, L):- setof(X, R^primode(X,N,R), L).
lista(tios,     N, L):- setof(X, R^tiode(X,N,R), L).
lista(sobrinos, N, L):- setof(X, R^sobrinode(X,N,R), L).
lista(abuelos,  N, L):- setof(X, R^abuelos(X,N,R), L).
lista(nietos,   N, L):- setof(X, R^nietode(X,N,R), L).
lista(bisabuelos,   N, L):- setof(X, R^bisabuelos(X,N,R), L).
lista(bisnietos,    N, L):- setof(X, R^bisnietos(X,N,R), L).
lista(tatarabuelos, N, L):- setof(X, R^tatarabuelos(X,N,R), L).
lista(tataranietos, N, L):- setof(X, R^tatanietos(X,N,R), L).
lista(suegros,  N, L):- setof(X, R^suegros(X,N,R), L).
lista(nueros,   N, L):- setof(X, R^nueros(X,N,R), L).
```

Puntos clave:

- **`setof`** reúne todas las soluciones en una lista **ordenada y sin repetidos**.
- **`R^`** indica que la variable `R` (el texto explicativo que devuelven las reglas, como `[X, " es hermano(a) de ", Y]`) no debe tomarse en cuenta al agrupar.
- Si no hay ninguna solución, `setof` **falla**, y `lista/3` falla con él. Eso permite distinguir entre "hay resultados" y "no hay registro".
- La posición de `N` en cada regla depende de lo que significa la regla. Para los nietos de `N` se usa `nietode(X, N, R)` ("X es nieto de N"); para los abuelos de `N` se usa `abuelos(X, N, R)` ("X es abuelo de N").

---

## 6. Construcción de la respuesta

### 6.1 `elizaFam/3`

```prolog
elizaFam(Rel, Nombre0, R):-
    downcase_atom(Nombre0, Nombre),
    findall(P, candidato(Nombre, P), L0),
    sort(L0, Cs),
    elizaFam_(Cs, Rel, Nombre, R).
```

1. Convierte el nombre a minúsculas.
2. Reúne con `findall` todas las personas candidatas.
3. `sort` quita repetidos (una misma persona puede encontrarse por varios hechos).
4. Pasa la lista de candidatos a `elizaFam_/4`.

### 6.2 `elizaFam_/4`

Elige la respuesta según cuántas candidatas hay:

| Candidatas | Respuesta |
|-----------|-----------|
| Ninguna | `No conozco a <nombre>` |
| Una | Se llama a `responde/3` con esa persona |
| Varias | `Hay varias personas llamadas <nombre>: <lista>. Escribe el nombre completo.` |

### 6.3 `responde/3`

Tiene tres cláusulas, que se prueban en este orden:

**a) Relación `desconocida`**
Responde `No entendi que familiar de <persona> buscas`. Es una salida de seguridad para cuando la frase no trae una palabra de relación reconocida.

**b) Relación `todos`**
```prolog
findall(Linea,
        ( relacionTodos(Rel), lista(Rel, C, L),
          maplist(bonito, L, LB),
          atomic_list_concat(LB, ', ', T),
          atomic_list_concat([Rel, ': ', T], Linea) ),
        Ls)
```
Recorre `relacionTodos`. Para cada relación que tenga resultados arma una línea del estilo `padre: anselmo ramirez`. Las relaciones sin resultados fallan en `lista/3` y simplemente no aparecen. Las líneas se unen con `; ` y se antepone `Familiares de <persona> -> `. Si no quedó ninguna línea, responde que no hay familiares registrados.

**c) Cualquier otra relación**
Si `lista(Rel, C, L)` tiene éxito, responde `<relacion> de <persona>: <lista>`. Si falla, responde `No tengo registro de <relacion> de <persona>`.

La respuesta `R` es un **átomo** (texto simple), no una lista. Por eso `writeln(R)` la imprime sin corchetes.

---

## 7. Reglas de parentesco

Todas devuelven además un tercer argumento `R` con una frase en forma de lista (por ejemplo `[HIJO, " es hijo(a) de ", PADRE]`). `lista/3` no usa ese texto y lo ignora con `R^`.

### 7.1 `hijode(HIJO, PADRE_O_MADRE, R)`
Dos cláusulas: una por `padrede` y otra por `madrede`. Es verdadera si el segundo argumento es el padre o la madre del primero.

### 7.2 `hermanode(HER, OHER, R)`
```prolog
(   padrede(P, HER), padrede(P, OHER)
;   madrede(M, HER), madrede(M, OHER)
),
HER \= OHER
```
Dos personas distintas son hermanas si comparten padre **o** madre. Con esto también cuentan los medios hermanos y las personas con un solo progenitor registrado.

### 7.3 `primode(PRIMO, OPRIMO, R)`
Cada uno es hijo de alguien (`hijode`), y esos dos "alguien" son hermanos (`hermanode`). Es decir, los padres de ambos son hermanos entre sí.

### 7.4 `tiode(TIO, SOBRINO, R)` y `sobrinode(SOBRINO, TIO, R)`
Tienen tres alternativas cada una:

1. El tío es **hermano** de un padre o madre del sobrino.
2. El tío es **esposo/a** de alguien (`esposade(TIO, ESP)`) que es hermano de un padre o madre del sobrino.
3. Lo mismo que la anterior, pero con la pareja registrada en el otro orden (`esposade(ESP, TIO)`), porque `esposade` siempre lleva primero a la esposa.

Así se cuentan tanto los tíos de sangre como los políticos.

### 7.5 `abuelo/3`, `abuela/3`, `abuelos/3`, `nietode/3`
- `abuelo(ABUELO, NIETO, R)`: el abuelo es padre de un padre o madre del nieto.
- `abuela(ABUELA, NIETO, R)`: la abuela es madre de un padre o madre del nieto.
- `abuelos(ABUELOS, NIETO, R)`: es verdadera si es abuelo **o** abuela.
- `nietode(NIETO, ABUELOS, R)`: la relación inversa, usando las mismas reglas.

### 7.6 `bisabuelos/3` y `bisnietos/3`
```prolog
bisabuelos(BISA, BISN, R):-
    abuelos(BISA, PAMA, _),
    ( padrede(PAMA, BISN) ; madrede(PAMA, BISN) ).
```
Un bisabuelo es abuelo de alguien (`PAMA`) que es padre o madre del bisnieto. Se contemplan las dos líneas, paterna y materna. `bisnietos(BISN, BISA, R)` es la relación inversa.

### 7.7 `tatarabuelos/3` y `tatanietos/3`
Siguen el mismo razonamiento, un nivel más arriba: un tatarabuelo es bisabuelo de alguien que es padre o madre del tataranieto. `tatanietos(TANI, TABU, R)` es la inversa. El template habla de `tataranietos`, pero el predicado interno se llama `tatanietos`; la tabla `lista/3` ya hace esa traducción.

### 7.8 `suegros/3` y `nueros/3`
Un suegro es padre o madre de alguien (`PA`) que está casado con la nuera o yerno. Como `esposade(Esposa, Esposo)` tiene un orden fijo, se prueban los dos órdenes (`esposade(NUER, PA)` y `esposade(PA, NUER)`). `nueros(NUER, SUEG, R)` es la relación inversa.

### 7.9 `conyuge(CUNADA, ECUNADA, R)`
Describe a los cuñados: la pareja de un hermano, o el hermano de la pareja. Está definida en el archivo, pero ningún template de familia la consulta.

---

## 8. Paso a paso: una consulta sencilla

**Entrada del usuario:** `quien es el padre de teodoro ?`

1. **Lectura.** `readln` convierte la línea en la lista `[quien, es, el, padre, de, teodoro, ?]`. El `?` queda como una palabra aparte.
2. **Recorrido de templates.** `eliza/1` prueba los templates en orden. Los de saludo, gustos e información no coinciden con esta frase.
3. **Coincidencia.** Llega a `template([quien, es, el, padre, de, s(_)], [flagFam], [5])`. Las cinco primeras palabras son idénticas; `s(_)` acepta `teodoro`; el template se termina y el `?` sobrante se acepta.
4. **`replace0`.** Se llama con índices `[5]`. La primera cláusula (índices vacíos) no aplica; la de familia sí: la bandera es `flagFam` y se ejecuta el `!`.
5. **División de la frase.** `dividir(5, Input, Pre, Nombre)` separa `Pre = [quien, es, el, padre, de]` y `Nombre = teodoro` (el `?` se descarta por ser puntuación).
6. **Relación.** `relacion(Pre, Rel)` revisa `quien`, `es`, `el` (no están en la tabla) y llega a `padre`, que sí: `Rel = padre`.
7. **Nombre.** `elizaFam(padre, teodoro, R)` pasa el nombre a minúsculas y llama a `candidato`:
   - `persona(teodoro)` es falso (no existe exactamente así).
   - Se busca el prefijo `teodoro_`: solo coincide `teodoro_ramirez_flores`.
   - Queda una candidata.
8. **Respuesta.** `responde(padre, teodoro_ramirez_flores, R)` ejecuta `lista(padre, ...)`:
   `setof(P, padrede(P, teodoro_ramirez_flores), L)` da `L = [anselmo_ramirez]`.
9. **Formato.** `bonito` convierte los nombres (`anselmo ramirez`, `teodoro ramirez flores`) y se arma el texto con `atomic_list_concat`.
10. **Salida.** `writeln(R)` imprime:

   ```
   padre de teodoro ramirez flores: anselmo ramirez
   ```
11. **Ciclo.** `eliza/1` lee la siguiente frase y vuelve a empezar.

---

## 9. Paso a paso: consulta con una relación calculada

**Entrada:** `quienes son los abuelos de emiliano`

1. `readln` da `[quienes, son, los, abuelos, de, emiliano]`.
2. Coincide `template([quienes, son, los, abuelos, de, s(_)], [flagFam], [5])`. Aquí no hay `?`, y el template igualmente se cumple.
3. `dividir` da `Nombre = emiliano` y `relacion` encuentra `abuelos`.
4. `candidato` encuentra a `emiliano_ramirez_soto`.
5. `lista(abuelos, emiliano_ramirez_soto, L)` ejecuta `setof(X, R^abuelos(X, emiliano_ramirez_soto, R), L)`:
   - Por `abuelo`: `padrede(X, carlos_ramirez_mendoza)` y `padrede(carlos_ramirez_mendoza, emiliano_ramirez_soto)` dan `roberto_ramirez_torres`.
   - Por `abuela`: `madrede(X, carlos_ramirez_mendoza)` y `padrede(carlos_ramirez_mendoza, emiliano_ramirez_soto)` dan `laura_mendoza`.
   - `setof` los ordena sin repetidos.
6. Se imprime:

   ```
   abuelos de emiliano ramirez soto: laura mendoza, roberto ramirez torres
   ```

---

## 10. Paso a paso: todos los familiares

**Entrada:** `que familiares tiene maria ?`

1. Frase: `[que, familiares, tiene, maria, ?]`. Coincide el template de índice `[3]`, así que `dividir` toma desde la palabra 3 y el nombre es `maria`.
2. `relacion` encuentra `familiares` y devuelve `todos`.
3. `candidato` encuentra una sola persona: `maria_ramirez_flores` (`mariana_soto` no cuenta porque no empieza con `maria_`).
4. `responde(todos, ...)` recorre `relacionTodos` en orden: `padre`, `madre`, `hermanos`, `hijos`, `primos`, etc. Para cada una llama a `lista/3`:
   - Las que tienen resultados generan una línea, por ejemplo `padre: anselmo ramirez` o `madre: petra flores`.
   - Las que no tienen resultados fallan y no aparecen.
5. Las líneas se unen con `; ` y se imprime algo con esta forma:

   ```
   Familiares de maria ramirez flores -> padre: anselmo ramirez; madre: petra flores; hermanos: ...; hijos: ...
   ```

---

## 11. Otros casos que maneja

| Entrada | Qué ocurre | Salida |
|---------|-----------|--------|
| `quienes son los hijos de andres ?` | Dos personas empiezan con `andres_`: `andres_ramirez_mendoza` y `andres_vidal` | `Hay varias personas llamadas andres: andres ramirez mendoza, andres vidal. Escribe el nombre completo.` |
| `quienes son los hijos de andres_vidal ?` | Coincide exactamente con una persona | Se muestran sus hijos |
| `quienes son los hijos de andres vidal ?` | `dividir` une las palabras y queda `andres_vidal`, igual que el caso anterior | Se muestran sus hijos |
| `quien es el padre de pedro ?` | Nadie empieza con `pedro_` | `No conozco a pedro` |
| `quienes son los hermanos de isabella ?` | La persona existe, pero `setof` no encuentra hermanos | `No tengo registro de hermanos de isabella ramirez` |

---

## 12. Detalles a tener en cuenta

- El nombre puede escribirse como `andres`, `andres_vidal` o `andres vidal`. Todo lo que va después del índice del template se toma como parte del nombre, así que no deben agregarse palabras extra al final (por ejemplo `por favor`).
- No se manejan acentos; se escribe `quien`, no `quién`.
- Si la frase no coincide con ningún template de familia, `eliza/1` sigue probando templates y termina en el de respaldo (`Por favor, explica un poco mas.`).
- El orden de los templates importa: los más específicos deben ir antes que los generales.