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
template([hola, camabola], ['que', 'paso'], []).
template([holawas], ['holawas','en','que','te','puedo','ayudar','?'], []).
template([hola, eliza, como, estas], ['Hola', 'estoy', 'muy', 'bien', 'gracias', 'y', 'tu', '?'], []).
template([hola, eliza, que, haces], ['Hola', 'aqui', 'platicando', 'contigo', 'y', 'tu', 'que', 'haces', '?'], []).
template([hola, eliza], ['Hola', 'que', 'gusto', 'saludarte', '!'], []).
template([hola, como, estas], ['Hola', 'yo', 'estoy', 'bien', 'y', 'tu', '?'], []).
template([hola, como, te, va], ['Hola', 'me', 'va', 'excelente', 'y', 'a', 'ti', '?'], []).
template([hola, como, amaneciste], ['Hola', 'amanecí', 'listo', 'para', 'ayudarte'], []).
template([hola, que, tal], ['Hola', 'todo', 'bien', 'y', 'tu', '?'], []).
template([hola, que, haces], ['Hola', 'estoy', 'esperando', 'tu', 'consulta'], []).
template([hola, buenas], ['Hola', 'buenas', 'como', 'te', 'va', '?'], []).
template([hola, buenos, dias], ['Hola', 'buenos', 'dias', 'espero', 'que', 'estes', 'bien'], []).
template([hola, buenas, tardes], ['Hola', 'buenas', 'tardes', 'en', 'que', 'te', 'ayudo', '?'], []).
template([hola, buenas, noches], ['Hola', 'buenas', 'noches', 'como', 'estuvo', 'tu', 'dia', '?'], []).
template([hola, s(_), yo, soy, s(_),'.'], [hola , 1, yo, soy , 1], [1, 4]).
template([hola, _], ['Hola', 'como', estas, tuc, '?'], []).

template([como, estas], ['Estoy', 'bien', 'gracias', 'y', 'tu', 'como', 'estas', '?'], []).
template([como, estas, hoy], ['Hoy', 'estoy', 'de', 'maravilla', 'y', 'tu', '?'], []).
template([como, te, va], ['Me', 'va', 'muy', 'bien', 'gracias', 'y', 'a', 'ti', '?'], []).
template([como, te, encuentras], ['Me', 'encuentro', 'bien', 'gracias', 'por', 'preguntar'], []).
template([como, te, sientes], ['Me', 'siento', 'bien', 'aunque', 'soy', 'un', 'programa', 'y', 'tu', '?'], []).
template([como, andas], ['Aqui', 'andamos', 'bien', 'y', 'tu', '?'], []).
template([como, amaneciste], ['Amaneci', 'con', 'ganas', 'de', 'platicar', 'y', 'tu', '?'], []).
template([como, dormiste], ['Yo', 'no', 'duermo', 'pero', 'y', 'tu', 'dormiste', 'bien', '?'], []).
template([como, has, estado], ['He', 'estado', 'bien', 'procesando', 'informacion', 'y', 'tu', '?'], []).
template([como, te, fue, hoy], ['Mi', 'dia', 'va', 'bien', 'y', 'el', 'tuyo', '?'], []).
template([como, va, tu, dia], ['Va', 'muy', 'bien', 'y', 'el', 'tuyo', '?'], []).
template([como, esta, tu, dia], ['Esta', 'siendo', 'un', 'buen', 'dia', 'y', 'el', 'tuyo', '?'], []).
template([como, te, trata, la, vida], ['La', 'vida', 'de', 'un', 'chatbot', 'es', 'tranquila', 'y', 'la', 'tuya', '?'], []).
template([todo, bien], ['Que', 'bueno', 'me', 'alegra', 'mucho'], []).
template([que, tal, estas], ['Bien', 'gracias', 'y', 'tu', '?'], []).
template([que, tal, tu, dia], ['Muy', 'bien', 'gracias', 'y', 'el', 'tuyo', '?'], []).
template([que, tal], ['Bien', 'y', 'tu', '?'], []).

% por si escriben con acento
template([como, estas], ['Estoy', 'bien', 'gracias', 'y', 'tu', '?'], []).
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

template([buenardas], ['buenas', 'te', 'encunetras', 'bien'], []).
template([buenas, tardes, _, estas, bien, '?'], ['Yo', 0, 'estoy', 'bien', 'y', 'tu', '?'], [2]).
template([buenos,dias], ['Buenos','dias','espero','que','estes','bien'], []).
template([buenas, tardes], ['No','te','tardes'], []).
template([buenas, noches], ['Buenas', 'nocehs', 'es', 'momento', 'de', 'dormir'], []).
template([hey], ['Hey', 'que', 'tal', '!'], []).
template([ola], ['Hola', 'como', 'estas', '?'], []).
template([alo], ['Hola', 'te', 'escucho'], []).
template([saludos], ['Saludos', 'espero', 'que', 'estes', 'muy', 'bien'], []).
template([buenas], ['Buenas', 'como', 'te', 'encuentras', '?'], []).
template([buenos, dias, eliza], ['Buenos', 'dias', 'espero', 'que', 'hayas', 'dormido', 'bien'], []).
template([buenas, tardes, eliza], ['Buenas', 'tardes', 'como', 'va', 'tu', 'dia', '?'], []).
template([buenas, noches, eliza], ['Buenas', 'noches', 'descansa', 'mucho'], []).
template([buenas, tardes, como, estas], ['Buenas', 'tardes', 'yo', 'bien', 'y', 'tu', '?'], []).
template([buenos, dias, como, estas], ['Buenos', 'dias', 'estoy', 'bien', 'y', 'tu', '?'], []).
template([buenas, noches, como, estas], ['Buenas', 'noches', 'estoy', 'bien', 'y', 'tu', '?'], []).
template([mucho, gusto], ['El', 'gusto', 'es', 'mio'], []).
template([que, gusto, verte], ['Igualmente', 'me', 'da', 'gusto', 'platicar', 'contigo'], []).
template([tanto, tiempo], ['Es', 'verdad', 'que', 'bueno', 'que', 'volviste'], []).

template([yo, estoy, bien], ['eso','me', 'alegra', '!'], []).
template([yo,tambien, espero, que,estes, bien], ['Gracias','por','preocuparte','por','mi'], []).
template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).
template([todo, bien, todo, correcto,','], ['Y','yo','que','me','alegro'], []).
template([estoy, bien], ['Me', 'alegra', 'mucho', 'que', 'estes', 'bien'], []).
template([estoy, muy, bien], ['Que', 'excelente', 'me', 'da', 'gusto'], []).
template([estoy, mal], ['Lo', 'siento', 'quieres', 'contarme', 'que', 'paso', '?'], []).
template([yo, estoy, mal], ['Lo', 'lamento', 'quieres', 'platicarlo', '?'], []).
template([estoy, cansado], ['Descansa', 'un', 'poco', 'te', 'hara', 'bien'], []).
template([estoy, cansada], ['Descansa', 'un', 'poco', 'te', 'hara', 'bien'], []).
template([estoy, triste], ['Lamento', 'oir', 'eso', 'que', 'te', 'puso', 'triste', '?'], []).
template([estoy, aburrido], ['Podemos', 'platicar', 'de', 'lo', 'que', 'quieras'], []).
template([estoy, aburrida], ['Podemos', 'platicar', 'de', 'lo', 'que', 'quieras'], []).
template([estoy, feliz], ['Que', 'bueno', 'que', 'te', 'hace', 'feliz', '?'], []).
template([estoy, enojado], ['Respira', 'profundo', 'que', 'te', 'molesto', '?'], []).
template([me, siento, s(_)], ['Por', 'que', 'te', 'sientes', 0, '?'], [2]).
template([asi, asi], ['Y', 'eso', 'por', 'que', '?'], []).
template([mas, o, menos], ['Ojala', 'mejore', 'tu', 'dia'], []).
template([bien, y, tu], ['Yo', 'tambien', 'estoy', 'bien', 'gracias'], []).
template([bien, gracias], ['De', 'nada', 'me', 'alegra'], []).

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
template([yo, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([porfavor, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []).
template([dime, a, s(_), _], ['No', no, puedo, ',', soy, malo, en, eso], []).
template([como, te, llamas], ['Me', 'llamo', 'Eliza', 'tu', 'chatbot'], []).
template([cual, es, tu, nombre], ['Mi', 'nombre', 'es', 'Eliza'], []).
template([quien, eres], ['Soy', 'Eliza', 'un', 'chatbot', 'hecho', 'en', 'prolog'], []).
template([de, donde, eres], ['Soy', 'de', 'la', 'computadora', 'donde', 'me', 'ejecutas'], []).
template([cuantos, anos, tienes], ['No', 'tengo', 'edad', 'soy', 'un', 'programa'], []).
template([mi, nombre, es, s(_)], ['Mucho', 'gusto', 0, 'como', 'estas', '?'], [3]).
template([me, llamo, s(_)], ['Mucho', 'gusto', 0, 'en', 'que', 'te', 'ayudo', '?'], [2]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

%%%%%%%%%%%% templates de familia %%%%%%%%%%%%
% Solo llevan la bandera [flagFam]. La relacion (padre, hijos, primos...)
% se detecta en replace0 a partir de las palabras que escribio el usuario.
% No llevan "_" al final: asi funcionan con o sin "?".
% El nombre puede escribirse como "andres", "andres_vidal" o "andres vidal".

% familiares en general
template([que, familia, tiene, s(_)], [flagFam], [3]).
template([cual, es, la, familia, de, s(_)], [flagFam], [5]).
template([quienes, son, los, familiares, de, s(_)], [flagFam], [5]).
template([dime, los, familiares, de, s(_)], [flagFam], [4]).
template([familiares, de, s(_)], [flagFam], [2]).
template([cuentame, de, la, familia, de, s(_)], [flagFam], [5]).
template([hablame, de, la, familia, de, s(_)], [flagFam], [5]).

% "que X tiene ..."
template([que, familiares, tiene, s(_)], [flagFam], [3]).
template([que, padres, tiene, s(_)], [flagFam], [3]).
template([que, hijos, tiene, s(_)], [flagFam], [3]).
template([que, hermanos, tiene, s(_)], [flagFam], [3]).
template([que, primos, tiene, s(_)], [flagFam], [3]).
template([que, tios, tiene, s(_)], [flagFam], [3]).
template([que, sobrinos, tiene, s(_)], [flagFam], [3]).
template([que, abuelos, tiene, s(_)], [flagFam], [3]).
template([que, nietos, tiene, s(_)], [flagFam], [3]).
template([que, suegros, tiene, s(_)], [flagFam], [3]).
template([quien, es, el, padre, de, s(_)], [flagFam], [5]).
template([quien, es, la, madre, de, s(_)], [flagFam], [5]).

% "quienes son X ..."
template([quienes, son, los, padres, de, s(_)], [flagFam], [5]).
template([quienes, son, los, hijos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, hermanos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, primos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, tios, de, s(_)], [flagFam], [5]).
template([quienes, son, los, sobrinos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, abuelos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, nietos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, bisabuelos, de, s(_)],[flagFam], [5]).
template([quienes, son, los, bisnietos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, tatarabuelos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, tataranietos, de, s(_)], [flagFam], [5]).
template([quienes, son, los, suegros, de, s(_)], [flagFam], [5]).
template([quienes, son, los, nueros, de, s(_)], [flagFam], [5]).

% "cuales son los ..."
template([cuales, son, los, padres, de, s(_)], [flagFam], [5]).
template([cuales, son, los, hijos, de, s(_)], [flagFam], [5]).
template([cuales, son, los, hermanos, de, s(_)], [flagFam], [5]).
template([cuales, son, los, primos, de, s(_)], [flagFam], [5]).
template([cuales, son, los, tios, de, s(_)], [flagFam], [5]).
template([cuales, son, los, sobrinos, de, s(_)], [flagFam], [5]).
template([cuales, son, los, abuelos, de, s(_)], [flagFam], [5]).
template([cuales, son, los, nietos, de, s(_)], [flagFam], [5]).

% "dime los ..."
template([dime, los, hermanos, de, s(_)], [flagFam], [4]).
template([dime, los, primos, de, s(_)], [flagFam], [4]).
template([dime, los, tios, de, s(_)], [flagFam], [4]).
template([dime, los, hijos, de, s(_)], [flagFam], [4]).
template([dime, los, abuelos, de, s(_)], [flagFam], [4]).

% singular: "quien es el/la ..."
template([quien, es, el, papa, de, s(_)],[flagFam], [5]).
template([quien, es, la, mama, de, s(_)],[flagFam], [5]).
template([quien, es, el, hijo, de, s(_)],[flagFam], [5]).
template([quien, es, la, hija, de, s(_)],[flagFam], [5]).
template([quien, es, el, hermano, de, s(_)],[flagFam], [5]).
template([quien, es, la, hermana, de, s(_)],[flagFam], [5]).
template([quien, es, el, primo, de, s(_)], [flagFam], [5]).
template([quien, es, la, prima, de, s(_)], [flagFam], [5]).
template([quien, es, el, tio, de, s(_)], [flagFam], [5]).
template([quien, es, la, tia, de, s(_)], [flagFam], [5]).
template([quien, es, el, sobrino, de, s(_)],[flagFam], [5]).
template([quien, es, la, sobrina, de, s(_)],[flagFam], [5]).
template([quien, es, el, abuelo, de, s(_)], [flagFam], [5]).
template([quien, es, la, abuela, de, s(_)], [flagFam], [5]).
template([quien, es, el, nieto, de, s(_)], [flagFam], [5]).
template([quien, es, la, nieta, de, s(_)], [flagFam], [5]).
template([quien, es, el, suegro, de, s(_)], [flagFam], [5]).
template([quien, es, la, suegra, de, s(_)], [flagFam], [5]).
template([quien, es, el, bisabuelo, de, s(_)],[flagFam], [5]).
template([quien, es, el, tatarabuelo, de, s(_)],   [flagFam], [5]).

% plurales femeninos / otras palabras
template([quienes, son, las, tias, de, s(_)], [flagFam], [5]).
template([quienes, son, las, primas, de, s(_)], [flagFam], [5]).
template([quienes, son, las, hermanas, de, s(_)], [flagFam], [5]).
template([quienes, son, las, abuelas, de, s(_)], [flagFam], [5]).
template([quienes, son, las, sobrinas, de, s(_)], [flagFam], [5]).
template([quienes, son, los, yernos, de, s(_)], [flagFam], [5]).
template([quienes, son, las, nueras, de, s(_)], [flagFam], [5]).

% preguntas sobre la familia de Eliza
template([tienes, familia],    ['Mi', 'familia', 'son', 'los', 'programadores', 'que', 'me', 'crearon'], []).
template([tu, tienes, familia],['Mi', 'familia', 'son', 'los', 'programadores', 'que', 'me', 'crearon'], []).
template([cual, es, tu, familia], ['Mi', 'familia', 'son', 'mis', 'lineas', 'de', 'codigo'], []).
template([tienes, hermanos],   ['No', 'tengo', 'hermanos', 'soy', 'un', 'chatbot', 'unico'], []).
template([tu, tienes, hermanos],  ['No', 'tengo', 'hermanos', 'soy', 'un', 'chatbot', 'unico'], []).
template([tienes, hijos], ['No', 'tengo', 'hijos', 'solo', 'tengo', 'reglas'], []).
template([tienes, papa],['Mi', 'papa', 'es', 'quien', 'me', 'programo'], []).
template([quien, es, tu, papa],['Mi', 'papa', 'es', 'quien', 'me', 'programo'], []).
template([quien, es, tu, mama],['Mi', 'mama', 'es', 'la', 'computadora', 'donde', 'vivo'], []).
template([quien, te, creo],    ['Me', 'creo', 'un', 'programador', 'con', 'mucha', 'paciencia'], []).

% el usuario habla de su familia
template([mi, familia, es, grande], ['Que', 'bonito', 'una', 'familia', 'grande', 'es', 'una', 'bendicion'], []).
template([mi, familia, es, pequena],['Lo', 'importante', 'es', 'que', 'se', 'quieran', 'mucho'], []).
template([mi, familia], ['Cuentame', 'mas', 'sobre', 'tu', 'familia'], []).
template([tengo, hermanos],    ['Que', 'bien', 'cuantos', 'hermanos', 'tienes', '?'], []).
template([yo, tengo, hermanos],['Que', 'bien', 'cuantos', 'hermanos', 'tienes', '?'], []).
template([tengo, hijos],['Que', 'bonito', 'cuantos', 'hijos', 'tienes', '?'], []).
template([extrano, a, mi, familia], ['Es', 'normal', 'extranarlos', 'puedes', 'llamarlos', 'hoy'], []).
template([me, llevo, bien, con, mi, familia], ['Que', 'bueno', 'eso', 'es', 'muy', 'valioso'], []).
template([me, llevo, mal, con, mi, familia],  ['Lamento', 'eso', 'quieres', 'contarme', 'que', 'paso', '?'], []).
template([mi, mama], ['Cuentame', 'mas', 'sobre', 'tu', 'mama'], []).
template([mi, papa], ['Cuentame', 'mas', 'sobre', 'tu', 'papa'], []).
template([mi, hermano], ['Cuentame', 'mas', 'sobre', 'tu', 'hermano'], []).
template([mi, hermana], ['Cuentame', 'mas', 'sobre', 'tu', 'hermana'], []).
template([mi, abuelo],  ['Cuentame', 'mas', 'sobre', 'tu', 'abuelo'], []).
template([mi, abuela],  ['Cuentame', 'mas', 'sobre', 'tu', 'abuela'], []).
template([mi, tio],  ['Cuentame', 'mas', 'sobre', 'tu', 'tio'], []).
template([mi, tia],  ['Cuentame', 'mas', 'sobre', 'tu', 'tia'], []).
template([mi, primo],['Cuentame', 'mas', 'sobre', 'tu', 'primo'], []).
template([mi, prima],['Cuentame', 'mas', 'sobre', 'tu', 'prima'], []).
template([mi, hijo], ['Cuentame', 'mas', 'sobre', 'tu', 'hijo'], []).
template([mi, hija], ['Cuentame', 'mas', 'sobre', 'tu', 'hija'], []).
template([mi, esposa],  ['Cuentame', 'mas', 'sobre', 'tu', 'esposa'], []).
template([mi, esposo],  ['Cuentame', 'mas', 'sobre', 'tu', 'esposo'],[]).


%%%%%%%%%%%% templates de Neumonia %%%%%%%%%%%%




%%%%%%%%%%%% templates de tuberculosis %%%%%%%%%%%%

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


% CORREGIDO: basta compartir padre o madre (cuenta medios hermanos y
% personas con un solo progenitor registrado)
hermanode(HER, OHER, R):-
    (   padrede(P, HER), padrede(P, OHER)
    ;   madrede(M, HER), madrede(M, OHER)
    ),
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


% CORREGIDO: ahora cubre la linea paterna y la materna
bisabuelos(BISA, BISN, R):-
    abuelos(BISA, PAMA, _),
    ( padrede(PAMA, BISN) ; madrede(PAMA, BISN) ),
    R = [BISA, " es bisabuelo(a) de ", BISN].


bisnietos(BISN, BISA, R):-
    bisabuelos(BISA, BISN, _),
    R = [BISN, " es bisnieto de ", BISA].


% CORREGIDO: ahora cubre la linea paterna y la materna
tatarabuelos(TABU, TANI, R):-
    bisabuelos(TABU, PAMA, _),
    ( padrede(PAMA, TANI) ; madrede(PAMA, TANI) ),
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


%%%%%%%%%%%%% ELIZA FAMILIA: apoyo para flagFam %%%%%%%%%%%%%

% Palabra del usuario -> relacion que se consulta
relPalabra(familia,todos).
relPalabra(familiares,   todos).
relPalabra(padre, padre).
relPalabra(papa,padre).
relPalabra(mama,madre).
relPalabra(madre, madre).
relPalabra(padres,padres).
relPalabra(papas,  padres).
relPalabra(hijo,hijos).
relPalabra(hija,hijos).
relPalabra(hijas,  hijos).
relPalabra(hijos, hijos).
relPalabra(hermanos,hermanos).
relPalabra(hermano,hermanos).
relPalabra(hermana,hermanos).
relPalabra(hermanas, hermanos).
relPalabra(primo,  primos).
relPalabra(prima,  primos).
relPalabra(primas, primos).
relPalabra(primos,primos).
relPalabra(tios,  tios).
relPalabra(tio, tios).
relPalabra(tia, tios).
relPalabra(tias,tios).
relPalabra(sobrino,sobrinos).
relPalabra(sobrina,sobrinos).
relPalabra(sobrinas, sobrinos).
relPalabra(sobrinos,sobrinos).
relPalabra(abuelos, abuelos).
relPalabra(abuelo, abuelos).
relPalabra(abuela, abuelos).
relPalabra(abuelas,abuelos).
relPalabra(nieto,  nietos).
relPalabra(nieta,  nietos).
relPalabra(nietas, nietos).
relPalabra(nietos,nietos).
relPalabra(bisabuelos,   bisabuelos).
relPalabra(bisabuelo,bisabuelos).
relPalabra(bisabuela,bisabuelos).
relPalabra(bisnieto, bisnietos).
relPalabra(bisnieta, bisnietos).
relPalabra(bisnietos,    bisnietos).
relPalabra(tatarabuelos, tatarabuelos).
relPalabra(tatarabuelo,   tatarabuelos).
relPalabra(tatarabuela,   tatarabuelos).
relPalabra(tataranieto,   tataranietos).
relPalabra(tataranieta,   tataranietos).
relPalabra(tataranietos, tataranietos).
relPalabra(suegros, suegros).
relPalabra(suegro, suegros).
relPalabra(suegra, suegros).
relPalabra(nuera,  nueros).
relPalabra(nueras, nueros).
relPalabra(nueros,nueros).
relPalabra(yerno,  nueros).
relPalabra(yernos, nueros).

% Palabras que forman parte del nombre (se ignora la puntuacion)
palabraNombre(W):- atom(W), \+ member(W, ['?', '.', ',', '!']).

% dividir(+I, +Input, -Pre, -Nombre)
% Pre    = palabras antes del nombre (sirven para detectar la relacion)
% Nombre = palabras desde la posicion I hasta el final, unidas con "_"
%"andres"  -> andres      "andres vidal" -> andres_vidal
%"andres_vidal" (una sola palabra) -> andres_vidal
dividir(I, Input, Pre, Nombre):-
	length(Pre, I),
	append(Pre, Resto, Input),
	include(palabraNombre, Resto, Palabras),
	maplist(downcase_atom, Palabras, Min),
	atomic_list_concat(Min, '_', Nombre).

% Busca en las palabras la que indica la relacion (padre, primos, ...)
relacion(Palabras, Rel):- member(W, Palabras), relPalabra(W, Rel), !.
relacion(_, desconocida).

% Todas las personas de la base (incluye a quienes solo salen en padrede/madrede)
persona(X):- padrede(X,_) ; padrede(_,X) ; madrede(X,_) ; madrede(_,X)
           ; esposade(X,_) ; esposade(_,X).

% Permite escribir "teodoro" o "teodoro ramirez" en vez del nombre completo
candidato(N, N):- persona(N), !.
candidato(N, P):-
    atom_concat(N, '_', Pref),
    persona(P),
    sub_atom(P, 0, _, _, Pref).

% teodoro_ramirez_flores -> 'teodoro ramirez flores'
bonito(A, B):-
    atomic_list_concat(Partes, '_', A),
    atomic_list_concat(Partes, ' ', B).

% Relaciones que se muestran en "que familiares tiene ..."
relacionTodos(X):- member(X, [padre, madre, hermanos, hijos, primos, tios,
    sobrinos, abuelos, nietos, bisabuelos, bisnietos, tatarabuelos,
    tataranietos, suegros, nueros]).

% Listas por relacion (sin duplicados)
lista(padre,  N, L):- setof(P, padrede(P,N), L).
lista(madre,  N, L):- setof(M, madrede(M,N), L).
lista(padres, N, L):- setof(P, (padrede(P,N) ; madrede(P,N)), L).
lista(hijos,  N, L):- setof(H, (padrede(N,H) ; madrede(N,H)), L).
lista(hermanos, N, L):- setof(X, R^hermanode(X,N,R), L).
lista(primos, N, L):- setof(X, R^primode(X,N,R), L).
lista(tios,   N, L):- setof(X, R^tiode(X,N,R), L).
lista(sobrinos, N, L):- setof(X, R^sobrinode(X,N,R), L).
lista(abuelos,N, L):- setof(X, R^abuelos(X,N,R), L).
lista(nietos, N, L):- setof(X, R^nietode(X,N,R), L).
lista(bisabuelos,    N, L):- setof(X, R^bisabuelos(X,N,R), L).
lista(bisnietos,N, L):- setof(X, R^bisnietos(X,N,R), L).
lista(tatarabuelos,  N, L):- setof(X, R^tatarabuelos(X,N,R), L).
lista(tataranietos,  N, L):- setof(X, R^tatanietos(X,N,R), L).
lista(suegros,N, L):- setof(X, R^suegros(X,N,R), L).
lista(nueros, N, L):- setof(X, R^nueros(X,N,R), L).

% elizaFam(+Relacion, +Nombre, -Respuesta)  (Respuesta es un atomo)
elizaFam(Rel, Nombre0, R):-
    downcase_atom(Nombre0, Nombre),
    findall(P, candidato(Nombre, P), L0),
    sort(L0, Cs),
    elizaFam_(Cs, Rel, Nombre, R).

elizaFam_([], _, N, R):- !,
    bonito(N, NB),
    atomic_list_concat(['No conozco a ', NB], R).
elizaFam_([C], Rel, _, R):- !,
    responde(Rel, C, R).
elizaFam_(Cs, _, N, R):-
    maplist(bonito, Cs, Bs),
    atomic_list_concat(Bs, ', ', L),
    bonito(N, NB),
    atomic_list_concat(['Hay varias personas llamadas ', NB, ': ', L,
                        '. Escribe el nombre completo.'], R).

responde(desconocida, C, R):- !,
    bonito(C, CB),
    atomic_list_concat(['No entendi que familiar de ', CB, ' buscas'], R).

responde(todos, C, R):- !,
    bonito(C, CB),
    findall(Linea,
            ( relacionTodos(Rel), lista(Rel, C, L),
              maplist(bonito, L, LB),
              atomic_list_concat(LB, ', ', T),
              atomic_list_concat([Rel, ': ', T], Linea) ),
            Ls),
    (   Ls == []
    ->  atomic_list_concat(['No tengo familiares registrados de ', CB], R)
    ;   atomic_list_concat(Ls, '; ', T2),
        atomic_list_concat(['Familiares de ', CB, ' -> ', T2], R)
    ).

responde(Rel, C, R):-
    bonito(C, CB),
    (   lista(Rel, C, L)
    ->  maplist(bonito, L, LB),
        atomic_list_concat(LB, ', ', T),
        atomic_list_concat([Rel, ' de ', CB, ': ', T], R)
    ;   atomic_list_concat(['No tengo registro de ', Rel, ' de ', CB], R)
    ).


%%%%%%%%%%%%% Lo que le gusta a eliza : flagLike %%%%%%%%%%%%
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(manzanas).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).

%%%%%%%%%%%%% lo que hace eliza: flagDo %%%%%%%%%%%%
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(estudiar).
does(cocinar).
does(trabajar).

%%%%%%%%%%%%% lo que es eliza: flagIs %%%%%%%%%%%%
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(tonto).
is0(raro).
is0(agradable).
is0(bien).
is0(feliz).
is0(redundante).

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
	nth0(0, Resp, X),
	X == flagFam,
	!,
	dividir(I, Input, Pre, Nombre),
	relacion(Pre, Rel),
	elizaFam(Rel, Nombre, R).

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