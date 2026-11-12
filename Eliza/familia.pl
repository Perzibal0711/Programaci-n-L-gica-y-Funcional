
:- use_module(library(readutil)).


eliza :-
    writeln('Hola, mi nombre es Eliza.'),
    writeln('Ingresa tu consulta:'),
    read_line_as_list(Input),
    eliza(Input).


% Salida
eliza([adios]) :-
    writeln('Adios. Espero haberte ayudado.'), !.


% Buscar una plantilla
eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input), !,
    replace0(IndStim, Input, Resp, R),
    writeln(R),
    read_line_as_list(Input1),
    eliza(Input1).


% Respuesta por defecto
eliza(_) :-
    writeln('Por favor, explica un poco mas.'),
    read_line_as_list(Input),
    eliza(Input).


% Plantillas
template([eliza, quien, es, el, hijo, de, s(_)],
         [flagfam], [6]).


% Base de datos
padre(juan, luis).
padre(juan, antonio).
padre(luis, carlos).

% Consulta familiar
familia(X, R) :-
    findall(Y, padre(X, Y), R).

% Coincidencias
match([], []).

match([S|Stim], [I|Input]) :-
    atom(S),
    S == I,
    match(Stim, Input).

match([s(_)|Stim], [_|Input]) :-
    match(Stim, Input).

% Reemplazo
replace0([I], Input, [flagfam], R) :-
    nth0(I, Input, Atom),
    familia(Atom, R).

% Leer entrada
read_line_as_list(Input) :-
    read_line_to_string(user_input, String),
    split_string(String, " ", " ", InputList),
    maplist(atom_string, Input, InputList).
