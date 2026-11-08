# Actividad 22 replace0/5

## Código

```
replace0([I|Index], Input, N, Resp, R):-
    nth0(I, Input, Atom),
    length(Index, M), M > 0,
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R), !.

replace0([I|Index], Input, N, Resp, R):-
    length(Index, M), M =:= 0,
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([], _, _, Resp, Resp).
```

## Llamada inicial

```
?- replace0([4],
            [que, pacho, eliza, soy, leonardo],
            1,
            [pasa, que, esoy, procesando, informacion, 1],
            R).
```

## Análisis del patrón

- `Index = [4]` se une con `[I|Index]` → `I = 4`, `Index = []`
- `length([], M)` → `M = 0`
- Como `M = 0`, la cláusula 1 (`M > 0`) **falla** y se usa la cláusula 2 (`M =:= 0`)
- En esta llamada **no se ejecuta** `N1 is N + 1`, porque es el último índice

## Paso 1: intento con la cláusula 1

1. `nth0(4, [que, pacho, eliza, soy, leonardo], Atom)` → `Atom = leonardo`
2. `length([], M)` → `M = 0`
3. `M > 0` → **falla**, Prolog pasa a la siguiente cláusula

## Paso 2: cláusula 2 (último índice)

1. `length([], M)` → `M = 0`
2. `M =:= 0` → **cumple**
3. `nth0(4, Input, Atom)` → `Atom = leonardo`
4. `N = 1` (placeholder que toca reemplazar)
5. Resp actual = `[pasa, que, esoy, procesando, informacion, 1]`

Se ejecuta:

```
select(1, [pasa, que, esoy, procesando, informacion, 1], leonardo, R1)
```

Sustituyendo el placeholder `1` por `leonardo`:

```
R1 = [pasa, que, esoy, procesando, informacion, leonardo]
```

6. `append(R1, [], R)` → `R = [pasa, que, esoy, procesando, informacion, leonardo]`
7. `!` → corte, termina

## Árbol de derivación

```
                        replace0([4], Input, 1, Resp, R)
input      que, pacho, eliza, soy, leonardo   |
Resp       pasa, que, esoy, procesando, informacion, 1
                            |
            ----------------------------------------
            |                                       |
    CLÁUSULA 1                        CLÁUSULA 2
    I = 4, Index = []                 I = 4, Index = []
    nth0(4, Input, Atom)              length([], M) → M = 0
    → Atom = leonardo                 M =:= 0 → CUMPLE ✔
    length([], M) → M = 0             nth0(4, Input, Atom)
    M > 0 → FALLA ✘                  → Atom = leonardo
                                      Placeholder N = 1
    NO se ejecuta select              select(1, Resp, leonardo, R1)
    NO se ejecuta N1 is N + 1         → R1 = [pasa, que, esoy,
                                              procesando, informacion,
                                              leonardo]
                                      NO se ejecuta N1 is N + 1
                                      append(R1, [], R)
                                      !
                                            |
                                            v
        R = [pasa, que, esoy, procesando, informacion, leonardo]
```

## Resumen

Se usa `N1 is N + 1` (cláusula 1) cuando:
- hay más índices por procesar (`M > 0`)

NO se usa (cláusula 2) cuando:
- es el último índice (`M = 0`)

## Resultado final del proceso

```
R = [pasa, que, esoy, procesando, informacion, leonardo].
```