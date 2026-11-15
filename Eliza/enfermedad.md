# Cómo funciona ENFERMEDADES en Eliza

Responde preguntas sobre **neumonía** y **tuberculosis**: información,
síntomas, diagnóstico, medicinas, doctores, regiones, tratamiento y
prevención.

```
que es la neumonia
cuales son los sintomas de la tuberculosis
que medicinas tomo para la neumonia
en que estados hay tuberculosis
como se previene la neumonia
```

---

## 1. El recorrido de una pregunta

```
usuario escribe   →  [que, sintomas, da, la, neumonia]
        ↓
eliza/1 prueba los template/3 en orden
        ↓
match/2 compara la frase con el template
        ↓
replace0 (cláusula flagEnf) toma el tema y busca la enfermedad con los 2 índices
        ↓
elizaEnf → respuestaEnf arma la respuesta con los datos
```

---

## 2. El template: dos índices

Es el mismo formato que en familia: **[posición de la palabra clave,
posición de lo que escribe el usuario]**.

```prolog
template([que, sintomas, da, s(_)], [flagEnf], [1, 3]).
```

| Parte | Significado |
|---|---|
| `[que, sintomas, da, s(_)]` | Forma de la frase. `s(_)` acepta cualquier palabra (aquí, la enfermedad). |
| `[flagEnf]` | Bandera: es una pregunta de enfermedades. |
| `[1, 3]` | `1` = posición del **tema**; `3` = desde dónde está la **enfermedad**. |

Posiciones (desde 0) en `que sintomas da la neumonia`:

```
0 que   1 sintomas   2 da   3 la   4 neumonia
```

- Índice `1` → `sintomas` (el tema).
- Índice `3` → el `s(_)`. La enfermedad se busca **desde ahí en adelante**:
  salta `la` y encuentra `neumonia`. Por eso funciona igual con o sin
  artículo (`la neumonia` o `neumonia`).

| Familia | Enfermedades |
|---|---|
| `[3, 5]`: relación (`suegros`), nombre | `[1, 3]`: tema (`sintomas`), enfermedad |
| El nombre es todo lo que sigue desde el índice | La enfermedad es la primera palabra conocida desde el índice |

Más ejemplos:

| Template | Índices | Tema | Enfermedad desde |
|---|---|---|---|
| `[cuales, son, los, sintomas, de, s(_)]` | `[3, 5]` | `sintomas` | posición 5 |
| `[como, se, previene, s(_)]` | `[2, 3]` | `previene` | posición 3 |
| `[que, medicinas, tomo, para, s(_)]` | `[1, 4]` | `medicinas` | posición 4 |
| `[en, que, estados, hay, s(_)]` | `[2, 4]` | `estados` | posición 4 |
| `[tratamiento, de, s(_)]` | `[0, 2]` | `tratamiento` | posición 2 |

### Cómo agregar una nueva forma de preguntar

1. Escribe la frase y pon `s(_)` donde empieza la enfermedad (al final).
2. Cuenta la posición de la palabra del tema.
3. Cuenta la posición del `s(_)`.

Ejemplo para `que medicinas me recomiendan para la neumonia`:

```
0 que  1 medicinas  2 me  3 recomiendan  4 para  5 la  6 neumonia
```

```prolog
template([que, medicinas, me, recomiendan, para, s(_)], [flagEnf], [1, 5]).
```

---

## 3. La cláusula de `replace0`

```prolog
replace0([ITema, IEnf|_], Input, _, [flagEnf], R):-
	!,
	nth0(ITema, Input, Tema),
	length(Pre, IEnf),
	append(Pre, Resto, Input),
	member(Enf, Resto),
	palabraEnf(Enf, _),
	!,
	elizaEnf(Tema, Enf, R).
```

Con `[que, sintomas, da, la, neumonia]` y `[1, 3]`:

1. `nth0(1, Input, Tema)` → `Tema = sintomas`.
2. Se parte la frase: `Pre = [que, sintomas, da]`, `Resto = [la, neumonia]`.
3. `member(Enf, Resto), palabraEnf(Enf, _)` recorre `Resto`: `la` no es una
   enfermedad, **`neumonia` sí**.
4. `elizaEnf(sintomas, neumonia, R)` arma la respuesta.

Si el tema o la enfermedad no son válidos, falla y Eliza prueba otro
template.

---

## 4. Los diccionarios

### `palabraEnf/2`: palabra → enfermedad

```prolog
palabraEnf(neumonia, neumonia).
palabraEnf(pulmonia, neumonia).
palabraEnf(tb, tuberculosis).
```

### `temas/2`: palabras → tema

```prolog
temas(sintomas,   [sintomas, sintoma]).
temas(medicinas,  [medicinas, medicina, medicamentos, medicamento, tomo, tomar]).
temas(prevencion, [prevencion, previene, prevenir, evitar, evito, protejo, vacuna, medidas]).
```

Hay ocho temas: `info`, `sintomas`, `diagnostico`, `medicinas`,
`doctores`, `regiones`, `tratamiento`, `prevencion`. Para que una palabra
sirva como tema debe estar en la lista del tema correspondiente.

---

## 5. Cómo se arma la respuesta

```prolog
respuestaEnf(info, E, R):- !, informacionde(E, R).
respuestaEnf(Tema, E, R):-
    dato(Tema, Hecho, Titulo),
    G =.. [Hecho, E, X],
    findall(X, G, L0),
    ...
```

- **Información:** devuelve el párrafo de `informacionde/2`.
- **Los demás temas:** `dato/3` dice qué hecho consultar y qué título poner.

| Tema | Hecho | Título |
|---|---|---|
| sintomas | `sintomasde` | Síntomas de |
| diagnostico | `diagnosticode` | Cómo se diagnostica |
| medicinas | `medicinade` | Medicinas para |
| doctores | `especialistade` | Doctores que atienden |
| regiones | `regionenfermedad` | Regiones donde se presenta |
| tratamiento | `tratamientode` | Tratamiento de |
| prevencion | `medidasde` | Cómo prevenir |

`findall` junta los hechos de esa enfermedad, `bonito/2` cambia `_` por
espacios, `unir/2` los pone como lista con `- ` y se agrega la nota
"solo un médico puede diagnosticar o recetar".

```
Síntomas de la neumonia:
- tos
- flema
- fiebre
...
(Información educativa: solo un médico puede diagnosticar o recetar.)
```

---

## 6. Templates por tema (resumen)

| Tema | Ejemplos de frases |
|---|---|
| Información | `que es ...`, `dime sobre ...`, `hablame de ...`, `como se contagia ...`, `que causa ...` |
| Síntomas | `cuales son los sintomas de ...`, `que sintomas tiene ...` |
| Diagnóstico | `como se diagnostica ...`, `que pruebas se hacen para ...` |
| Medicinas | `que medicinas tomo para ...`, `que puedo tomar para ...` |
| Doctores | `que doctor atiende ...`, `a que doctor voy si tengo ...` |
| Regiones | `en que estados hay ...`, `donde se presenta ...` |
| Tratamiento | `como se trata ...`, `cual es el tratamiento de ...` |
| Prevención | `como se previene ...`, `hay vacuna para ...`, `como evitar ...` |

---

## 7. La red de seguridad (`flagEnfAuto`)

Al final de los templates de enfermedades hay uno que acepta **cualquier
frase** y no usa índices:

```prolog
template([], [flagEnfAuto], []).
```

Su cláusula busca en toda la frase una palabra de tema y una enfermedad,
sin importar el orden:

```prolog
replace0(_, Input, _, [flagEnfAuto], R):-
	!,
	temaEn(Input, Tema),
	member(Enf, Input),
	palabraEnf(Enf, E),
	!,
	respuestaEnf(Tema, E, R).
```

`temaEn/2` prefiere los temas específicos (síntomas, medicinas…) y usa
`info` (`es`, `dime`…) solo si no hay otro. Así,
`oye dime los sintomas de la tb` responde síntomas y no información.

Si la frase no tiene tema o enfermedad, contesta
"Por favor, explica un poco mas.".

---

## 8. Cómo agregar una enfermedad nueva

1. Agrega sus palabras: `palabraEnf(gripe, gripe).`
2. Agrega sus hechos (como los de neumonía): `informacionde/2`,
   `sintomasde/2`, `medicinade/2`, `especialistade/2`,
   `regionenfermedad/2`, `tratamientode/2`, `diagnosticode/2`,
   `medidasde/2`.

No hace falta tocar templates ni `replace0`.

---

## 9. Si algo no responde

- Contesta "Por favor, explica un poco mas." → ningún template coincidió y la frase no tiene un tema y una enfermedad reconocibles. Revisa
  `temas/2` y `palabraEnf/2`.
- Escribe `neumonia` sin acento, en minúsculas.
- Si responde un tema equivocado, revisa que la palabra no esté en la
  lista de otro tema.
- Si agregaste un template, revisa que el primer índice apunte al tema y
  el segundo al `s(_)` de la enfermedad.