# Operación Lambda — Informe
**Agente:** [Nombre / Matrícula]

## Misión 1
- Tabla predicción vs CLISP (a–f):
- Errores de predicción y por qué:
- Puntos de Elena (expresión + salida):
- (car (cdr '(ana))):

| Clave | Expresion | Prediccion | CLISP |
|:----: | :----: | :----: | :----: |
|a | (car (cdr (car *agentes*))) | 28 | 28 |
|b | (car (car (cdr *agentes*))) | beto | BETO |
|c | (cdr (car (cdr (cdr *agentes*)))) | (22 1 morelia 45) | (22 1 MORELIA 45) |
|d | (car (cdr (cdr (cdr (car (cdr (cdr (cdr *agentes*)))))))) | zamora | ZAMORA |
|e | (caddr (cadr *agentes*)) | uruapan | 5 |
|f | (car (cdr (cdr (car (cdr (cdr (cdr (cdr *agentes*)))))))) | 2 | 2 |

*Error en la clave `c`*
Se tubo una salida diferente con clisp de la prediccion,y esto sucedio por que al momento de trasformar los `cadr` y `caddr` a sus versiones separadas los aplique mal, y por eso dio otro resultado.

*Funciones de `nombre`, `edad`, `nivel`, `base` y `puntos`*



## Misión 2
- Salidas de pase-de-lista, nombre-y-nivel, cumpleanios, aplicar-bonos:
- ¿Por qué #'car?:

## Misión 3
- Mensaje descifrado:
- Versión en una sola expresión:
- (Extra) comprobación de cifrado:

## Misión 4
- Sospechoso(s):
- Total de puntos de los leales:
- Promedio de edad (racional y decimal):
- Deducción de los dos nivel 5:

## Misión 5
| ID | ¿Truena? | Mensaje / resultado | Causa | Corrección |
|----|----------|---------------------|-------|------------|
- Sabotaje silencioso y regla de mapcar:

## Misión 6
- Salidas de los tres filtros:
- Salida del ensamble final:
- Ventaja de la fábrica: