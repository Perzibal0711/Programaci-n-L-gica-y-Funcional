# Actividad - Operacion Residencial
Agentes: en la Calle del Águila hay cuatro casas en fila. En cada una vive una persona, la casa tiene un color, la persona bebe algo y tiene una mascota. El cuartel necesita una sola respuesta:

**¿Quién tiene el pez?**

Nadie les dará la tabla completa. Les llegaron doce pistas. Su arma es Prolog básico: hechos, átomos y reglas. Primero modelan el dominio; después traducen pistas; luego deducen; al final consultan.

## Mapa de misiones.

| #  | Nombre en clave	| Habilidad que evalúa |
| -- | ---------------- | -------------------- |
| 1  | El Dominio de la Calle | Átomos, hechos de dominio, variables vs constantes |
| 2  | Pistas que ya son hechos | Traducir pistas directas a hechos|
| 3	 | La Fábrica de Reglas | Reglas cabeza :- cuerpo que conectan predicados|
| 4  | El Tablero de Deducción | Razonar pista a pista (estilo Einstein) con ayuda de Prolog|
| 5 | El Expediente Completo	| Codificar la solución y responder con reglas de consulta|
| 6	| Código Saboteado | Diagnosticar hechos/reglas rotas|
| ★ | Extra: El Buscador | (Opcional) member + listas si ya vieron ese tema|

**Pistas:**

1.- Ana vive en la casa 1.
2.- Ana vive en la casa blanca.
3.- Beto bebe café.

 4.- La casa verde está inmediatamente a la izquierda de la casa roja.

 5.- Quien vive en la casa verde bebe café.

6.- Carla bebe leche.

 7.- Quien tiene el perro vive junto a quien bebe agua.

 8.- Quien tiene el gato bebe agua.

 9.- Diego vive en la casa azul.

 10.- Quien tiene el loro bebe té.

11.- Carla tiene el pez.

 12.- Quien bebe té vive en la casa 4.

### Mision 1 - El dominio de la calle.

- La Historia.

    Antes de deducir, el analista debe fijar el vocabulario: qué átomos existen y qué predicados describirán el mundo.

- Clasificacion de expresiones.

| Expresión	| Tipo |
| --------- | ---- |
| ana       | atomo |
| P	        | variable |
| persona(carla). | hecho |	 
| vive_en(ana, 1). | hecho |	 
| dueno(P) :- tiene(P, pez). | regla |	

```
102 ?- persona(ana).
true.

103 ?- persona(X).
X = ana ;
X = beto ;
X = carla ;
X = diego.

104 ?- color(roja).
true.

105 ?- bebida(jugo).
false.
```

**Pregunta**

¿por qué persona(Ana) (con mayúscula) no pregunta por la persona ana? ¿Qué hace Prolog con Ana?.

```
107 ?- persona(Ana).
Ana = ana ;
Ana = beto ;
Ana = carla ;
Ana = diego.
```

Esto es devido a que cuando se coloca una mayuscula se evalua como si fuera una variable en ves de un atomo, o en ves de buscar e este caso a "ana", por eso a poner mayyuscula la letra "a", aparecen todos los nombres.

### Mision 2 - Pistas que ya son hechos.

- La Historia.

    Algunas pistas se traducen directo a hechos. Otras necesitan varias piezas a la vez: esas no se escriben aún como hechos sueltos.

Expliquen por qué la pista 4 no es un hecho aislado (necesita dos casas y una relación de posición).

- Esto es por que para saber el numero de la casa roja, para saber cual es cual, y entender de que lado se ven las casa para saber cual es la izquierda.

Expliquen por qué la pista 5, juntada con la 3, sí permite deducir un hecho nuevo sobre Beto… pero eso lo harán en la misión 4, no ahora.

- Por que nos da informacion acerca de la casa y de quien pertenece, pero como las reglas no son todavia juntando otras reglas no se puede crear esa arregla, asi mismo falta saber el nuemro que corresponde a la casa verde para asi crear la regla.

Consulta:

```
109 ?- vive_en(ana, N).
N = 1.

110 ?- bebe(beto, B).
B = cafe.
```

### Mision 3 - La fabrica de reglas

- La Historia.
    Los hechos son piezas. Las reglas las ensamblan. El mando pide predicados derivados: no están en la base, se infieren.

```
dueno_del_pez(P) :-
    tiene(P, pez).

color_de(Persona, Color) :-
    vive_en(Persona, N),
    color_casa(N, Color).

vecinos(P1, P2) :-
    vive_en(P1,N1), 
    vive_en(P2,N2),
    abs(N1 - N2) =:= 1.

bebe_en_casa(N, B):-
    bebe(Persona,B),
    vive_en(Persona,N).

perfil(P, N, Color, Bebida, Mascota):-
    vive_en(P, N),
    color_casa(N, Color),
    bebe(P, Bebida),
    tiene(P, Mascota).
```

**Pregunta**

 ¿qué papel juega la variable N? ¿Aparece en la cabeza? ¿Por qué se llama variable compartida?

 - Significa numero de la casa, por eso se utiliza la palabra N, y es compratida por que, utiliza para vincular dos  reglas.

### Mision 4 - El tablero de Deduccion

- La Historia.
    Como el acertijo de Einstein: van llenando una tabla. Prolog no adivina solo con las pistas sueltas; ustedes deducen y van agregando hechos cuando una conclusión sea segura.

- Tablero

| Casa |  Color | Persona | Bebida | Mascota |
| ---- | ------ | ------- | ------ | ------- |
|   1  | Blanca |   Ana   |  Agua  |  Gato   |
|   2  | Verde  |  Beto   |  Cafe  |  Perro  |
|   3  |  Roja  |  Carla  | Leche  |  Pez    |
|   4  |  Azul  |  Diego  |   Te   |  Loro   |

1. Con pistas 1 y 2: fija casa 1 (persona + color).
```
113 ?- color_de(ana,blanca).
true.
```
2. Con pistas 3 y 5: ¿quién vive en la casa verde y qué bebe?
    
    Beto vive en la casa verde y toma cafe.

3. Con pista 12 y 10: ¿qué se bebe y qué mascota hay en la casa 4?

    En la casa 4 se bebe te y tiene un loco en la casa 4.

4. Con pista 9 + lo anterior + pista 4: ¿de qué color es la casa 4? ¿Qué colores quedan para las casas 2 y 3?

    La casa 4 es de color azul, y los colores para la casa 2 y 3 es verde y roja.

5. Con pistas 6 y 11: completa la casa 3.
6. Con pista 8: completa bebida y mascota de la casa 1.
7. Cierra la casa 2. Verifica la pista 7 (vecinos).

```
120 ?- vecinos(beto,ana).
true .
```

- Consultas para verificar hechos.

```
121 ?- color_de(ana, C).
C = blanca ;
false.

121 ?- vecinos(beto, ana).
true ;
false.

122 ?- bebe_en_casa(4, B).
B = te.
```

### Mision 5 - El Expediente Completo.

- La Historia.
    El tablero ya está lleno. Ahora el archivo residencial.pl debe contener todos los hechos vive_en, color_casa, bebe y tiene (4 de cada uno), más las reglas de la misión 3.

```
123 ?- dueno_del_pez(P).
P = carla.


126 ?- perfil(P, N, Color, Bebida, Mascota).P = ana,
N = 1,
Color = blanca,
Bebida = agua,
Mascota = gato ;
P = beto,
N = 2,
Color = verde,
Bebida = cafe,
Mascota = perro ;
P = carla,
N = 3,
Color = roja,
Bebida = leche,
Mascota = pez ;
P = diego,
N = 4,
Color = azul,
Bebida = te,
Mascota = loro.

127 ?- vecinos(X, diego).
X = carla ;
false.

128 ?- color_de(beto, C).
C = verde ;
false.

129 ?- bebe(ana, B), tiene(ana, M).
B = agua,
M = gato.
```

- Respuesta al mando (una frase): ¿quién tiene el pez? ¿En qué casa vive? ¿De qué color es su casa? ¿Qué bebe?

    El pez lo tiene carla que vive en la casa 3 de color roja y bebe leche.

- Escriban una regla nueva resumen_pez/4 que unifique de una vez persona, número de casa, color y bebida del dueño del pez:

```
 resumen_pez(P, N, Color, Bebida) :-
    vive_en(P, N),
    color_casa(N, Color),
    bebe(P, Bebida),
    tiene(P, pez).
```

- Pregunta de cierre: ¿qué diferencia hay entre afirmar tiene(carla, pez). como hecho y consultar ?- dueno_del_pez(P).? ¿Cuál demuestra que entendieron hechos vs reglas?

    La diferencia es que, en tiene(carla, pez), se afirma de que carla es la dueña del pez, miestras que dueno_del_pez(P), es una regla por que compara con todas las opciones hasta encontrar una con la que coincida, y asi poder encontrar al dueño del pez.

### Mision 6 - Codigo saboteado

-La Historia.
    
    Un infiltrado alteró cinco líneas. Algunas hacen que Prolog diga false. Otras no fallan pero dan un mundo imposible (peor: pasan desapercibidas).

| ID | Fragmento saboteado | Correccio |
| -- | ------------------- | --------- |
| S1 | vive_en(Ana, 1). | vive_en(ana, 1).  |
| S2 | color_casa(2, Verde). | color_casa(2, verde). |
| S3 | bebe(beto, cafe) | bebe(beto, cafe). |
| S4 | vecinos(P1, P2) :- vive_en(P1, N), vive_en(P2, N). | vecinos(P1, P2) :- vive_en(P1, N), vive_en(P2, N),  abs(N1 - N2) =:= 1. |
| S5 | tiene(carla, pez). y además tiene(diego, pez). | Eliminar tiene(diego, pez).|

**Respuestas**

- S1.
    Warning:    Singleton variables: [Ana],true. nos da un a advertencia al cargar el archivo, lo cual no representa un errore, pero al hacer la consulta genera error por qu espera una variable que no existe.
- S2.
    Warning:    Singleton variables: [Verde],true. Pasa lo mismo que con el S1, al hacer la consulta genera error.

- S3.
    Syntax error: Operator expected. true. No da error directo por que falta colocar el ".", que cierra la sentencia, es parte de las reglas sintaxticas del lenguaje.
- S4.
    true. Si bien nos da true, y al ejecutarla no se ve un herror notable, se tiene un error, ya que no se cumple la regla como se planteo de buscar vecidos ya que para eso la doferencia de la distancia entrebcasas debe ser de 1, y al quitar esa restriccion ya no lo contempla y no h funcionaria correctamente.
- S5.
    true. Al correcla no habria problema, pero tendria el mismo error que con el S4, no respetaria las reglas que se estan declarando y abria confusin ya qu ahora dos personas tendrian un oez, y una persona tendria 2 mascotas.

**¿Cuál sabotaje es el más peligroso para el mando y por qué?**
El sabotaje mas peligroso es el de S4, y S5, ya que son los que corren sin errores o alvertencias, por tal motivo al hacer las consultas, pueden darnos infromacion erronea, y en consecuancia se tomarian deciciones erroneas.