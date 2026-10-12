Ejercicio

Identifiacr las variables de individuo, constantes de indivicuio, cuantificador, propiedades, relaciones, dominio del discurso.

- La Tierra es un planeta. 
    * Variable: No tiene
    * Constante: Tierra
    * Cuantificador: No tiene
    * Propiedades: ...es un planeta, planeta(tierra)
    * relaciones: No tiene
    * Dominio: Sistema Solar
- La Luna no es una planeta.
    * Variable: No tiene
    * Constante: Luna
    * Cuantificador: No tiene
    * Propiedades: ...no es una planeta, 
    * relaciones: No tiene
    * Dominio: Sistema solar.
- La Luna es un satelite.
    * Variable: No tiene
    * Constante: Luna
    * Cuantificador: No tiene
    * Propiedades: ...en un satelite, satelite(luna)
    * relaciones: No tiene
    * Dominio: Sistema solar
- La Tierra gira alrededor del Sol.
    * Variable: No tiene
    * Constante: Tierra, Sol
    * Cuantificador: No tiene
    * Propiedades: ...gira alrededor...
    * relaciones: GiraAlrededor(tierra, sol)
    * Dominio: Sistema Solar
- Todo planeta es un satelite.
    * Variable: planeta, satelite
    * Constante: No tiene
    * Cuantificador: ∀ todos
    * Propiedades: ...es un satelite
    * relaciones: No tiene
    * Dominio: Sistema solar
- Todo planeta gira al rededor del Sol.
    * Variable: planeta
    * Constante: Sol
    * Cuantificador: ∀ todos
    * Propiedades: ...gira alrededor...
    * relaciones: GiraAlrededor(X, sol)
    * Dominio: Sistema solar
- Algun planeta gira alrededor de la Luna.
    * Variable: planeta
    * Constante: luna
    * Cuantificador: ∃ algunos
    * Propiedades: ...gira alrededor de...
    * relaciones: GiraAlrededor(X, luna)
    * Dominio: Sistema solar
- Hay por lo menos un satelite.
    * Variable: satelite
    * Constante: satelite
    * Cuantificador: ∃ algunos
    * Propiedades: ...un satelite
    * relaciones: No tiene 
    * Dominio: Sistema salar
- Todos los perros del vecindario muerden a algun cartero.
    * Variable: perro, cartero
    * Constante: No tiene
    * Cuantificador: ∀ todos, ∃ algunos
    * Propiedades: ...muerden a...
    * relaciones: Muerde(X, Y)
    * Dominio: Vecindario
- Hay un cartero al que lo muerden todos los perros.
    * Variable: cartero, perro
    * Constante: No tiene
    * Cuantificador: ∃ algunos, ∀ todos
    * Propiedades: ...lo muerden..
    * relaciones: Mordido(Y, X)
    * Dominio: Vecindario
- Todos los carteros son mordidos por algun perro.
    * Variable: cartero, perro
    * Constante: No tiene
    * Cuantificador: ∀ todos, ∃ algunos
    * Propiedades: ...son mordidos...
    * relaciones: Mordido(Y, X)
    * Dominio: Vecindario
- Hay un perro que muerde a todos los carteros.
    * Variable: perro, cartero
    * Constante: No tiene
    * Cuantificador: ∃ algunos, ∀ todos
    * Propiedades: ...muerde a...
    * relaciones: Muerde(X, Y)
    * Dominio: Vecindario
- Todos los perros que asustan a algun cartero, lo muerden.
    * Variable: perro, cartero
    * Constante: No tiene
    * Cuantificador: ∀ todos, ∃ algunos
    * Propiedades: ...asustan a..., muerden
    * relaciones: Asustan(X, Y):- Muerde(X, Y)
    * Dominio: Vecindario
- Hay un perro que muerde a todos los perros que muerden a algun cartero.
    * Variable: perro, cartero
    * Constante: No tiene
    * Cuantificador: ∃ algunos, ∀ todos
    * Propiedades: ...muerde a..., 
    * relaciones: Muerde(Z, X):- Muerde(X, Y)
    * Dominio: Vecindario
- Hay un solo perro que se muerde asi mismo.
    * Variable: perro
    * Constante: No tiene
    * Cuantificador: ∃ algunos
    * Propiedades: ...muerde a...
    * relaciones: Muerde(X, X)
    * Dominio: Vecindario


- La Biblioteca Nacional tiene el libro "Don Quijote de la Mancha".
    * Variable: No tiene
    * Constante: Don quijote de la mancha, la biblioteca nacional
    * Cuantificador: No tiene
    * Propiedades: ...tiene...
    * relaciones: Tiene(BibliotecaN, Don Quijote de la Mancha)
    * Dominio: Biblioteca
- Todos los libros en la Biblioteca Nacional están catalogados.
    * Variable: libro, 
    * Constante: Biblioteca Nacional
    * Cuantificador: ∀ todos
    * Propiedades: ...estan catalogados.
    * relaciones: Los libros estan catalogados
    * Dominio: Biblioteca
- Existen libros que están en más de una biblioteca.
    * Variable: libros, biblioteca
    * Constante: No tiene
    * Cuantificador: ∃ algunos
    * Propiedades: ...estan en...
    * relaciones: Hay libros en mas deuna biblioteca
    * Dominio: Biblioteca
- Si un libro es raro, entonces no se puede prestar.
    * Variable: libro
    * Constante: No tiene
    * Cuantificador: no tiene
    * Propiedades: ...es raro
    * relaciones: Raro(libro)
    * Dominio: Biblioteca
- La Biblioteca Central tiene más de 10,000 libros.
    * Variable: libros
    * Constante: Biblioteca central
    * Cuantificador: ∃ algunos
    * Propiedades: ...tiene...
    * relaciones: La biblioteca central tiene 
    * Dominio: Biblioteca
- Todos los autores tienen al menos un libro en una biblioteca.
    * Variable: autores, libro, biblioteca
    * Constante: No tiene
    * Cuantificador: ∀ todos, ∃ algunos
    * Propiedades: ...tienen...en...
    * relaciones: Los autoeres tiene un libro en la biblioteca
    * Dominio: Biblioteca
- Existe un autor que tiene más de 5 libros publicados.
    * Variable: autor, libro
    * Constante: No tiene
    * Cuantificador: ∃ algunos
    * Propiedades: ...tiene...
    * relaciones: Autor que tiene mas de 5 libros
    * Dominio: Biblioteca
- No todos los libros de la biblioteca están en buen estado.
    * Variable: libro, biblioteca
    * Constante: No tiene
    * Cuantificador: ∀ todos
    * Propiedades: ...estan...
    * relaciones: Los libros estan
    * Dominio: Biblioteca
- Si un libro está en buen estado, puede ser prestado.
    * Variable: libro
    * Constante: No tiene
    * Cuantificador: No tiene
    * Propiedades: ...esta en buen estado
    * relaciones: esta en buen estado, y puede prestarse
    * Dominio: Biblioteca
- Todos los usuarios registrados pueden tomar prestado un libro.
    * Variable: usuario, libro
    * Constante: No tiene
    * Cuantificador: ∀ todos
    * Propiedades: ...pueden tomar...
    * relaciones: los usuarios registrados pueden tomar un libro
    * Dominio: Biblioteca
- Existen libros que solo se pueden consultar en la biblioteca.
    * Variable: libros, biblioteca
    * Constante: No tiene
    * Cuantificador: No tiene
    * Propiedades: ...solo se puede consultar...
    * relaciones: libros que se pueden consultarn en bibliotecas
    * Dominio: Biblioteca
- Todo libro prestado debe ser devuelto en 15 días.
    * Variable: libro
    * Constante: No tiene
    * Cuantificador: ∀ todos
    * Propiedades: ...debe ser devuelto...
    * relaciones: los libros presados deben ser devuletos
    * Dominio: Biblioteca
- Hay un libro que nadie ha pedido en préstamo.
    * Variable: libro
    * Constante: No tiene
    * Cuantificador: ∃ algunos
    * Propiedades: ...No se piede en orestamo
    * relaciones: Libro que nadie pide prestado
    * Dominio: Biblioteca
- Si un usuario tiene una multa, no puede pedir un libro prestado.
    * Variable: usuario
    * Constante: libro
    * Cuantificador: No tiene
    * Propiedades: ...tiene una multa, no puede pedir un libro prestado
    * relaciones: si se tiene una multa no se puede pedir prestado un libro
    * Dominio: Biblioteca
- Todos los libros escritos por un mismo autor están en la misma sección.
    * Variable: libros, autor
    * Constante: No tiene
    * Cuantificador: ∀ todos
    * Propiedades: ...escritos por un mismo autor
    * relaciones: los liros escritos por un mismo autor
    * Dominio: Biblioteca
- Existe un libro que tiene más de un ejemplar en la biblioteca.
    * Variable: libro, biblioteca
    * Constante: No tiene
    * Cuantificador: ∃ algunos
    * Propiedades: ...tiene mas de un ejemplar
    * relaciones: tiene mas de un ejemplar en la biblioteca
    * Dominio: Biblioteca
- Todo usuario con más de tres préstamos debe devolver uno para pedir otro.
    * Variable: usuario
    * Constante: No tiene
    * Cuantificador: ∀ todos
    * Propiedades: ...debe devolver...
    * relaciones: Los usuarios cno 3 prestamos deben devolver uno
    * Dominio: Biblioteca
- Hay una sección de la biblioteca donde todos los libros son de ciencias.
    * Variable: biblioteca, libros
    * Constante: ciencia
    * Cuantificador: ∀ todos  
    * Propiedades: ...son de ciencia
    * relaciones: No tiene
    * Dominio: Biblioteca
- No todos los libros en la biblioteca tienen más de 100 páginas.
    * Variable: libros, biblioteca
    * Constante: No tiene
    * Cuantificador: ∀ todos 
    * Propiedades: ...tienen mas de...
    * relaciones: No todo los libros tiene mas de 100 paginas
    * Dominio: Biblioteca
- Existe un usuario que ha tomado prestados todos los libros de la sección infantil.
    * Variable: usuario, libro
    * Constante: No tiene
    * Cuantificador: ∀ todos 
    * Propiedades: ...ha tomado prestado...
    * relaciones: No tiene
    * Dominio: Biblioteca