# Cómo funciona FAMILIA en Eliza

Permite preguntar por los familiares de alguien de la base de datos
(padres, hijos, hermanos, primos, tíos, abuelos, suegros…).

```
quienes son los hijos de andres vidal
que familia tiene andres
quien es la madre de camila
dime los primos de santiago
cuales son los suegros de emiliano
```

---

## 1. El recorrido de una pregunta

```
usuario escribe   →  [cuales, son, los, suegros, de, emiliano]
        ↓
eliza/1 prueba los template/3 en orden
        ↓
match/2 compara la frase con el template
        ↓
replace0 (cláusula flagFam) toma la relación y el nombre usando los 2 índices
        ↓
elizaFam busca a la persona y arma la respuesta
```

---

## 2. El template: dos índices

```prolog
template([cuales, son, los, suegros, de, s(_)], [flagFam], [3, 5]).
```

| Parte | Significado |
|---|---|
| `[cuales, son, los, suegros, de, s(_)]` | Forma de la frase. `s(_)` acepta cualquier palabra (aquí, el nombre). |
| `[flagFam]` | Bandera: es una pregunta de familia. |
| `[3, 5]` | `3` = posición de la **relación**; `5` = posición donde **empieza el nombre**. |

Posiciones (desde 0) en `cuales son los suegros de emiliano`:

```
0 cuales   1 son   2 los   3 suegros   4 de   5 emiliano
```

- Índice `3` → `suegros` (la relación).
- Índice `5` → `emiliano` (el nombre). Si el nombre tiene varias palabras
  (`andres vidal`), todo lo que sigue desde ese índice es el nombre.

Más ejemplos:

| Template | Índices | Relación | Nombre |
|---|---|---|---|
| `[que, hijos, tiene, s(_)]` | `[1, 3]` | `hijos` | desde la posición 3 |
| `[quien, es, el, padre, de, s(_)]` | `[3, 5]` | `padre` | desde la posición 5 |
| `[dime, los, primos, de, s(_)]` | `[2, 4]` | `primos` | desde la posición 4 |
| `[familiares, de, s(_)]` | `[0, 2]` | `familiares` | desde la posición 2 |

### Cómo agregar una nueva forma de preguntar

1. Escribe la frase y pon `s(_)` donde empieza el nombre (al final).
2. Cuenta la posición de la palabra de relación.
3. Cuenta la posición del `s(_)`.

Ejemplo para `me puedes decir los hijos de andres`:

```
0 me  1 puedes  2 decir  3 los  4 hijos  5 de  6 andres
```

```prolog
template([me, puedes, decir, los, hijos, de, s(_)], [flagFam], [4, 6]).
```

---

## 3. La cláusula de `replace0`

```prolog
replace0([IRel, INom|_], Input, _, [flagFam], R):-
	!,
	nth0(IRel, Input, Rel),
	length(Pre, INom),
	append(Pre, Nombre, Input),
	elizaFam(Rel, Nombre, R).
```

Con `[cuales, son, los, suegros, de, emiliano]` y `[3, 5]`:

1. `nth0(3, Input, Rel)` → `Rel = suegros`.
2. `length(Pre, 5)` + `append(Pre, Nombre, Input)` parte la frase:
   - `Pre = [cuales, son, los, suegros, de]`
   - `Nombre = [emiliano]`
3. `elizaFam(suegros, [emiliano], R)` arma la respuesta.

Si la palabra de `IRel` no es una relación conocida, `elizaFam` falla, la
cláusula falla y Eliza prueba el siguiente template.

---

## 4. `relacion/2`: de palabra a relación

```prolog
sinonimos(hijos, [hijo, hija, hijos, hijas]).
sinonimos(padre, [padre, papa]).
```

Convierte lo que escribe el usuario en una relación interna: `hija`,
`hijos` e `hijas` se vuelven `hijos`. Para aceptar una palabra nueva se
agrega a la lista de `sinonimos` que corresponda.

---

## 5. `elizaFam`: de nombre a respuesta

```prolog
elizaFam(Palabra, Resto, R)
```

1. Convierte la palabra en relación (`relacion/2`).
2. Quita signos (`? . , !`) de las palabras del nombre.
3. Une las palabras con `_`: `[andres, vidal]` → `andres_vidal`.
4. Busca **todas las personas cuyo nombre empiece así**
   (`sub_atom(P, 0, _, _, Nombre)`). Por eso `andres` encuentra a
   `andres_ramirez_mendoza` **y** a `andres_vidal`.
5. Para cada persona llama a `linea/3` y junta los resultados.

Mensajes especiales:

- Sin nombre → `Dime de quien quieres saber.`
- Persona no encontrada o sin ese familiar →
  `No encontre a esa persona o no tiene ese familiar.`

---

## 6. `lista/3` y `linea/3`

`lista(Relacion, Persona, Lista)` usa `setof` para sacar a los familiares
sin repetir:

```prolog
lista(hijos, N, L):- setof(H, (padrede(N,H) ; madrede(N,H)), L).
lista(primos, N, L):- setof(X, R^primode(X,N,R), L).
```

`linea/3` lo convierte en texto (`bonito/2` cambia `_` por espacios):

```
hijos de andres vidal: regina vidal ramirez, valentina vidal ramirez
```

Con `familia`/`familiares` (`todos`) muestra una línea por cada tipo de
familiar que tenga la persona.

---

## 7. Hechos y reglas

**Hechos** (lo único que se captura a mano):

```prolog
padrede(roberto_ramirez_torres, carlos_ramirez_mendoza).
madrede(laura_mendoza, carlos_ramirez_mendoza).
esposade(laura_mendoza, roberto_ramirez_torres).   % esposa, esposo
```

**Reglas** (se deducen solas):

| Regla | Cómo se deduce |
|---|---|
| `hijode` | hay un `padrede` o `madrede` |
| `hermanode` | comparten padre o madre (cuenta medios hermanos) |
| `primode` | sus padres son hermanos |
| `tiode` | hermano del padre/madre, o su pareja |
| `sobrinode` | inverso de tío |
| `abuelo`, `abuela`, `abuelos`, `nietode` | padre/madre del padre o madre |
| `bisabuelos`, `bisnietos` | un nivel más arriba/abajo |
| `tatarabuelos`, `tatanietos` | dos niveles más |
| `suegros`, `nueros` | padres de la pareja |

Para agregar una persona basta con añadir sus `padrede`, `madrede` y
`esposade`.

---

## 8. Si algo no responde

- Contesta "Por favor, explica un poco mas." → ningún template coincidió
  o la palabra de relación no está en `sinonimos`.
- Contesta "No encontre a esa persona…" → el nombre no empieza igual que
  en la base (`ramirez` solo no sirve; usa `andres`, `andres_ramirez`…).
- Escribe en minúsculas y sin acentos.
- Si agregaste un template, revisa que el primer índice apunte a la
  relación y el segundo al `s(_)` del nombre.