:- use_module(library(readutil)).

eliza:-	writeln('Hola , mi nombre es  Eliza tu  chatbot,
	por favor ingresa tu consulta,
	usar solo minúsculas sin . al final:'),
	readln(Input),
	eliza(Input),!.

eliza(Input):- Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.

eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1), %checar esto
	eliza(Input1), !.

%%%%%%%%%%%% templates de saludo, hola, etc. %%%%%%%%%%%%

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'como', estas, tu, '?'], [4]).
template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'como', estas, tus, '?'], [5]).
template([hola, s(_), yo, soy, s(_),'.'], [hola , 1, yo, soy , 1], [1, 4]).
template([hola, _], ['Hola', 'como', estas, tuc, '?'], []).
template([hola, camabola], ['que', 'paso'], []).
template([holawas], ['holawas','en','que','te','puedo','ayudar','?'], []).

template([que, onda], ['Hola', 'como', 'te', 'encunetras', '.'], []).
template([que, tal,'?'], ['Bien', 'y', 'tu','?'], []).
template([que, pachuca, por, toluca], ['que','trancita','por','tus','venas'], []).
template([que, pacho,'?'], ['Pasa','que','estoy','procesando','infromacion'], []).
template([que, pasa, ',', yo, estoy, bien], ['Que', 'bueno', 'yo', 'estoy', 'bien'], []).
template([que, pasa, _], ['Pasa', 'lo', 'que', 'pasa'], []).

template([hoy, es, un, dia, muy, soleado, no, cres, tu,'?'], ['Tienes razon es un dia muy soleado'], []).
template([hoy, es, mi, cumplenos], ['Felicidades'], []).
template([hoy, es, un, bonito, dia], ['Eso','es','cierto'], []).
template([hoy, _], ['Eso es interesante'], []).

template([buendia, mi, nombre, es, s(_), '.'], ['Buen dia', 'como', estas, tu, 0, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['Buen dia', 'como', estas, tu, 0, '?'], [4]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buen dia', 'como', estas, tus, 0, '?'], [5]).
template([buendia, _], ['Buendia', 'como', estas, tuc, '?'], []).
template([buenardas], ['buenas', 'te', 'encunetras', 'bien'], []).
template([buenas, tardes, _, estas, bien, '?'], ['Yo', 0, 'estoy', 'bien', 'y', 'tu', '?'], [2]).
template([buenos,dias], ['Buenos','dias','espero','que','estes','bien'], []).
template([buenas, tardes], ['No','te','tardes'], []).
template([buenas, noches], ['Buenas', 'nocehs', 'es', 'momento', 'de', 'dormir'], []).

template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).
template([yo, estoy, bien], ['eso','me', 'alegra', '!'], []).
template([yo,tambien, espero, que,estes, bien], ['Gracias','por','preocuparte','por','mi'], []).
template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).
template([todo, bien, todo, correcto,','], ['Y','yo','que','me','alegro'], []).

%%%%%%%%%%%% templates de gustos %%%%%%%%%%%%

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

% pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [1]).

%%%%%%%%%%%% informacion %%%%%%%%%%%%
template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
		 template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).

%%%%%%%%%%%% templates de familia %%%%%%%%%%%%				  

template([],[flagfam],[]).
%%%%%%%%%%%%%% TEMPLATES FAMILIA %%%%%%%%%%%%%%

% Consultar familiares
template([que, familiares, tiene, s(_), _], [flagFam], [3]).

% Consultar padre
template([quien, es, el, padre, de, s(_), _], [flagFam], [5]).

% Consultar madre
template([quien, es, la, madre, de, s(_), _], [flagFam], [5]).

% Consultar padres
template([quienes, son, los, padres, de, s(_), _], [flagFam], [5]).

% Consultar hijos
template([quienes, son, los, hijos, de, s(_), _], [flagFam], [5]).

% Consultar hermanos
template([quienes, son, los, hermanos, de, s(_), _], [flagFam], [5]).

% Consultar primos
template([quienes, son, los, primos, de, s(_), _], [flagFam], [5]).

% Consultar tíos
template([quienes, son, los, tios, de, s(_), _], [flagFam], [5]).

% Consultar sobrinos
template([quienes, son, los, sobrinos, de, s(_), _], [flagFam], [5]).

% Consultar abuelos
template([quienes, son, los, abuelos, de, s(_), _], [flagFam], [5]).

% Consultar nietos
template([quienes, son, los, nietos, de, s(_), _], [flagFam], [5]).

% Consultar bisabuelos
template([quienes, son, los, bisabuelos, de, s(_), _], [flagFam], [5]).

% Consultar bisnietos
template([quienes, son, los, bisnietos, de, s(_), _], [flagFam], [5]).

% Consultar tatarabuelos
template([quienes, son, los, tatarabuelos, de, s(_), _], [flagFam], [5]).

% Consultar tataranietos
template([quienes, son, los, tataranietos, de, s(_), _], [flagFam], [5]).

% Consultar suegros
template([quienes, son, los, suegros, de, s(_), _], [flagFam], [5]).

% Consultar nueras o yernos
template([quienes, son, los, nueros, de, s(_), _], [flagFam], [5]).


%%%%%%%%%%%% proceso de generar o buscar respuesta %%%%%%%%%%%%

template(_, ['Por favor, explica un poco mas.'], []). 

%%%%%%%%%%%%% La familia de eliza : flagfam %%%%%%%%%%%%% 

%%%%%%%%%%%%% HECHOS: PADRES %%%%%%%%%%%%%
padre(anselmo_ramirez).
padre(teodoro_ramirez_flores).
padre(isidro_cano).
padre(rafael_ramirez_flores).
padre(esteban_lara).
padre(ernesto_ramirez_nunez).
padre(pablo_reyes).
padre(alfonso_ramirez_nunez).
padre(aurelio_cano_ramirez).
padre(gustavo_ramirez_perez).
padre(mario_leon).
padre(hugo_prieto).
padre(roberto_ramirez_torres).
padre(javier_ramirez_torres).
padre(raul_gomez).
padre(diego_reyes_ramirez).
padre(ricardo_ramirez_rangel).
padre(carlos_ramirez_mendoza).
padre(daniel_ortega).
padre(luis_ramirez_cruz).
padre(emiliano_ramirez_soto).
padre(andres_vidal).
padre(santiago_ramirez_cruz).
padre(leonardo_ramirez_luna).

%%%%%%%%%%%%% HECHOS: MADRES %%%%%%%%%%%%%
madre(petra_flores).
madre(josefa_nunez).
madre(maria_ramirez_flores).
madre(elena_perez).
madre(dolores_ramirez_flores).
madre(guadalupe_torres).
madre(carmen_ramirez_nunez).
madre(silvia_rangel).
madre(lidia_vera).
madre(olga_diaz).
madre(camila_ramirez_soto).
madre(beatriz_ramirez_perez).
madre(rocio_lara_ramirez).
madre(laura_mendoza).
madre(marta_cruz).
madre(luz_ramirez_torres).
madre(lorena_soto).
madre(elisa_mora).
madre(mariana_soto).
madre(sofia_ramirez_mendoza).
madre(paty_salas).
madre(renata_cruz).
madre(fernanda_luna).

%%%%%%%%%%%%% HECHOS: PADRE DE %%%%%%%%%%%%%
padrede(anselmo_ramirez,teodoro_ramirez_flores).
padrede(anselmo_ramirez,maria_ramirez_flores).
padrede(anselmo_ramirez,rafael_ramirez_flores).
padrede(anselmo_ramirez,dolores_ramirez_flores).
padrede(anselmo_ramirez,jesus_ramirez_flores).
padrede(teodoro_ramirez_flores,ernesto_ramirez_nunez).
padrede(teodoro_ramirez_flores,carmen_ramirez_nunez).
padrede(teodoro_ramirez_flores,alfonso_ramirez_nunez).
padrede(ernesto_ramirez_nunez,roberto_ramirez_torres).
padrede(ernesto_ramirez_nunez,javier_ramirez_torres).
padrede(ernesto_ramirez_nunez,luz_ramirez_torres).
padrede(roberto_ramirez_torres,carlos_ramirez_mendoza).
padrede(roberto_ramirez_torres,sofia_ramirez_mendoza).
padrede(roberto_ramirez_torres,patricio_ramirez_mendoza).
padrede(roberto_ramirez_torres,andres_ramirez_mendoza).
padrede(roberto_ramirez_torres,marcela_ramirez_mendoza).
padrede(carlos_ramirez_mendoza,emiliano_ramirez_soto).
padrede(carlos_ramirez_mendoza,camila_ramirez_soto).
padrede(carlos_ramirez_mendoza,gabriel_ramirez_soto).
padrede(emiliano_ramirez_soto,santiago_ramirez_cruz).
padrede(emiliano_ramirez_soto,julia_ramirez_cruz).
padrede(santiago_ramirez_cruz,leonardo_ramirez_luna).
padrede(santiago_ramirez_cruz,mia_ramirez_luna).
padrede(leonardo_ramirez_luna,isabella_ramirez).
padrede(isidro_cano,aurelio_cano_ramirez).
padrede(isidro_cano,esperanza_cano_ramirez).
padrede(rafael_ramirez_flores,gustavo_ramirez_perez).
padrede(rafael_ramirez_flores,beatriz_ramirez_perez).
padrede(esteban_lara,rocio_lara_ramirez).
padrede(esteban_lara,martin_lara_ramirez).
padrede(pablo_reyes,diego_reyes_ramirez).
padrede(pablo_reyes,lucia_reyes_ramirez).
padrede(alfonso_ramirez_nunez,monica_ramirez_rangel).
padrede(alfonso_ramirez_nunez,ricardo_ramirez_rangel).
padrede(aurelio_cano_ramirez,hugo_cano_vera).
padrede(aurelio_cano_ramirez,paola_cano_vera).
padrede(gustavo_ramirez_perez,jorge_ramirez_diaz).
padrede(gustavo_ramirez_perez,daniela_ramirez_diaz).
padrede(mario_leon,ivan_leon_ramirez).
padrede(mario_leon,karla_leon_ramirez).
padrede(hugo_prieto,fabiola_prieto_lara).
padrede(javier_ramirez_torres,luis_ramirez_cruz).
padrede(javier_ramirez_torres,ana_ramirez_cruz).
padrede(raul_gomez,sebastian_gomez_ramirez).
padrede(raul_gomez,natalia_gomez_ramirez).
padrede(diego_reyes_ramirez,emma_reyes_soto).
padrede(ricardo_ramirez_rangel,tomas_ramirez_mora).
padrede(daniel_ortega,mateo_ortega_ramirez).
padrede(daniel_ortega,valeria_ortega_ramirez).
padrede(luis_ramirez_cruz,bruno_ramirez_salas).
padrede(andres_vidal,valentina_vidal_ramirez).
padrede(andres_vidal,regina_vidal_ramirez).

%%%%%%%%%%%%% HECHOS: MADRE DE %%%%%%%%%%%%%
madrede(petra_flores,teodoro_ramirez_flores).
madrede(petra_flores,maria_ramirez_flores).
madrede(petra_flores,rafael_ramirez_flores).
madrede(petra_flores,dolores_ramirez_flores).
madrede(petra_flores,jesus_ramirez_flores).
madrede(josefa_nunez,ernesto_ramirez_nunez).
madrede(josefa_nunez,carmen_ramirez_nunez).
madrede(josefa_nunez,alfonso_ramirez_nunez).
madrede(guadalupe_torres,roberto_ramirez_torres).
madrede(guadalupe_torres,javier_ramirez_torres).
madrede(guadalupe_torres,luz_ramirez_torres).
madrede(laura_mendoza,carlos_ramirez_mendoza).
madrede(laura_mendoza,sofia_ramirez_mendoza).
madrede(laura_mendoza,patricio_ramirez_mendoza).
madrede(laura_mendoza,andres_ramirez_mendoza).
madrede(laura_mendoza,marcela_ramirez_mendoza).
madrede(mariana_soto,emiliano_ramirez_soto).
madrede(mariana_soto,camila_ramirez_soto).
madrede(mariana_soto,gabriel_ramirez_soto).
madrede(renata_cruz,santiago_ramirez_cruz).
madrede(renata_cruz,julia_ramirez_cruz).
madrede(fernanda_luna,leonardo_ramirez_luna).
madrede(fernanda_luna,mia_ramirez_luna).
madrede(maria_ramirez_flores,aurelio_cano_ramirez).
madrede(maria_ramirez_flores,esperanza_cano_ramirez).
madrede(elena_perez,gustavo_ramirez_perez).
madrede(elena_perez,beatriz_ramirez_perez).
madrede(dolores_ramirez_flores,rocio_lara_ramirez).
madrede(dolores_ramirez_flores,martin_lara_ramirez).
madrede(carmen_ramirez_nunez,diego_reyes_ramirez).
madrede(carmen_ramirez_nunez,lucia_reyes_ramirez).
madrede(silvia_rangel,monica_ramirez_rangel).
madrede(silvia_rangel,ricardo_ramirez_rangel).
madrede(lidia_vera,hugo_cano_vera).
madrede(lidia_vera,paola_cano_vera).
madrede(olga_diaz,jorge_ramirez_diaz).
madrede(olga_diaz,daniela_ramirez_diaz).
madrede(beatriz_ramirez_perez,ivan_leon_ramirez).
madrede(beatriz_ramirez_perez,karla_leon_ramirez).
madrede(rocio_lara_ramirez,fabiola_prieto_lara).
madrede(marta_cruz,luis_ramirez_cruz).
madrede(marta_cruz,ana_ramirez_cruz).
madrede(luz_ramirez_torres,sebastian_gomez_ramirez).
madrede(luz_ramirez_torres,natalia_gomez_ramirez).
madrede(lorena_soto,emma_reyes_soto).
madrede(elisa_mora,tomas_ramirez_mora).
madrede(sofia_ramirez_mendoza,mateo_ortega_ramirez).
madrede(sofia_ramirez_mendoza,valeria_ortega_ramirez).
madrede(paty_salas,bruno_ramirez_salas).
madrede(camila_ramirez_soto,valentina_vidal_ramirez).
madrede(camila_ramirez_soto,regina_vidal_ramirez).

%%%%%%%%%%%%% HECHOS: ESPOSOS %%%%%%%%%%%%%
esposade(petra_flores, anselmo_ramirez).
esposade(josefa_nunez,teodoro_ramirez_flores).
esposade(maria_ramirez_flores,isidro_cano).
esposade(elena_perez,rafael_ramirez_flores).
esposade(dolores_ramirez_flores,esteban_lara).
esposade(guadalupe_torres,ernesto_ramirez_nunez).
esposade(carmen_ramirez_nunez,pablo_reyes).
esposade(silvia_rangel,alfonso_ramirez_nunez).
esposade(lidia_vera,aurelio_cano_ramirez).
esposade(olga_diaz,gustavo_ramirez_perez).
esposade(beatriz_ramirez_perez,mario_leon).
esposade(rocio_lara_ramirez,hugo_prieto).
esposade(laura_mendoza,roberto_ramirez_torres).
esposade(marta_cruz,javier_ramirez_torres).
esposade(luz_ramirez_torres,raul_gomez).
esposade(lorena_soto,diego_reyes_ramirez).
esposade(elisa_mora,ricardo_ramirez_rangel).
esposade(mariana_soto,carlos_ramirez_mendoza).
esposade(sofia_ramirez_mendoza,daniel_ortega).
esposade(paty_salas,luis_ramirez_cruz).
esposade(renata_cruz,emiliano_ramirez_soto).
esposade(camila_ramirez_soto,andres_vidal).
esposade(fernanda_luna,santiago_ramirez_cruz).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% REGLAS AUXILIARES %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% REGLAS DE FAMILIA %%%%%%%%%%%%%%

conyuge(CUNADA, ECUNADA, R):-
    (
        ((esposade(CUNADA, ESP); esposade(ESP, CUNADA)),
         hermanode(ESP, ECUNADA, _))
    ;
        ((esposade(ECUNADA, ESP); esposade(ESP, ECUNADA)),
         hermanode(ESP, CUNADA, _))
    ),
    R = [CUNADA, " es cuñada(o) de ", ECUNADA].


hijode(HIJO, PADRE, R):-
    padrede(PADRE, HIJO),
    R = [HIJO, " es hijo(a) de ", PADRE].

hijode(HIJO, MADRE, R):-
    madrede(MADRE, HIJO),
    R = [HIJO, " es hijo(a) de ", MADRE].


hermanode(HER, OHER, R):-
    padrede(PADRE, HER),
    padrede(PADRE, OHER),
    madrede(MADRE, HER),
    madrede(MADRE, OHER),
    HER \= OHER,
    R = [HER, " es hermano(a) de ", OHER].


primode(PRIMO, OPRIMO, R):-
    hijode(PRIMO, MPAMA, _),
    hijode(OPRIMO, SPAMA, _),
    hermanode(MPAMA, SPAMA, _),
    R = [PRIMO, " es primo(a) de ", OPRIMO].


tiode(TIO, SOBRINO, R):-
    (
        (hijode(SOBRINO, PAMA, _),
         hermanode(TIO, PAMA, _))
    ;
        (esposade(TIO, ESP),
         hermanode(ESP, PAMA, _),
         hijode(SOBRINO, PAMA, _))
    ;
        (esposade(ESP, TIO),
         hermanode(ESP, PAMA, _),
         hijode(SOBRINO, PAMA, _))
    ),
    R = [TIO, " es tio(a) de ", SOBRINO].


sobrinode(SOBRINO, TIO, R):-
    (
        (hijode(SOBRINO, PAMA, _),
         hermanode(TIO, PAMA, _))
    ;
        (esposade(TIO, ESP),
         hermanode(ESP, PAMA, _),
         hijode(SOBRINO, PAMA, _))
    ;
        (esposade(ESP, TIO),
         hermanode(ESP, PAMA, _),
         hijode(SOBRINO, PAMA, _))
    ),
    R = [SOBRINO, " es sobrino(a) de ", TIO].


abuelo(ABUELO, NIETO, R):-
    (
        (padrede(ABUELO, PAMA),
         padrede(PAMA, NIETO))
    ;
        (padrede(ABUELO, PAMA),
         madrede(PAMA, NIETO))
    ),
    R = [ABUELO, " es abuelo de ", NIETO].


abuela(ABUELA, NIETO, R):-
    (
        (madrede(ABUELA, PAMA),
         madrede(PAMA, NIETO))
    ;
        (madrede(ABUELA, PAMA),
         padrede(PAMA, NIETO))
    ),
    R = [ABUELA, " es abuela de ", NIETO].


abuelos(ABUELOS, NIETO, R):-
    (
        abuelo(ABUELOS, NIETO, _)
    ;
        abuela(ABUELOS, NIETO, _)
    ),
    R = [ABUELOS, " son los abuelos de ", NIETO].


nietode(NIETO, ABUELOS, R):-
    (
        abuelo(ABUELOS, NIETO, _)
    ;
        abuela(ABUELOS, NIETO, _)
    ),
    R = [NIETO, " es nieto de ", ABUELOS].


bisabuelos(BISA, BISN, R):-
    abuelos(BISA, PAMA, _),
    padrede(PAMA, BISN),
    R = [BISA, " es bisabuelo(a) de ", BISN].


bisnietos(BISN, BISA, R):-
    bisabuelos(BISA, BISN, _),
    R = [BISN, " es bisnieto de ", BISA].


tatarabuelos(TABU, TANI, R):-
    bisabuelos(TABU, PAMA, _),
    padrede(PAMA, TANI),
    R = [TABU, " es tatarabuelo de ", TANI].


tatanietos(TANI, TABU, R):-
    tatarabuelos(TABU, TANI, _),
    R = [TANI, " es tataranieto de ", TABU].


suegros(SUEG, NUER, R):-
    (
        (padrede(SUEG, PA),
         (esposade(NUER, PA); esposade(PA, NUER)))
    ;
        (madrede(SUEG, PA),
         (esposade(NUER, PA); esposade(PA, NUER)))
    ),
    R = [SUEG, " es suegro(a) de ", NUER].


nueros(NUER, SUEG, R):-
    (
        (padrede(SUEG, PA),
         (esposade(NUER, PA); esposade(PA, NUER)))
    ;
        (madrede(SUEG, PA),
         (esposade(NUER, PA); esposade(PA, NUER)))
    ),
    R = [NUER, " es nuera(o) de ", SUEG].


%%%%%%%%%%%%% Lo que le gusta a eliza : flagLike %%%%%%%%%%%%
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).

%%%%%%%%%%%%% lo que hace eliza: flagDo %%%%%%%%%%%%
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).

%%%%%%%%%%%%% lo que es eliza: flagIs %%%%%%%%%%%%
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

%%%%%%%%%%%%% match %%%%%%%%%%%%%

match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

match([s(_)|Stim], [_|Input]) :-
    match(Stim, Input).

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

%%%%%%%%%%%%%% Eliza familia: %%%%%%%%%%%%%
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagFam,
    elizaFam(Atom, R).

%%%%%%%%%%%%%% Eliza likes: %%%%%%%%%%%%%
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).

%%%%%%%%%%%%%% Eliza does: %%%%%%%%%%%%%
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).

%%%%%%%%%%%%%% Eliza is: %%%%%%%%%%%%%
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	elizaIs(Atom, R).

%%%%%%%%%%%%% remplace0 %%%%%%%%%%%%%

replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.

% Leer entrada
%read_line_as_list(Input) :-
%    read_line_to_string(user_input, String),
%    split_string(String, " ", " ", InputList),
%    maplist(atom_string, Input, InputList).