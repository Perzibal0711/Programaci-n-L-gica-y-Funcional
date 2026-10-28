casa(1).
casa(2).
casa(3).
casa(4).
persona(ana).
persona(beto).
persona(carla).
persona(diego).
color(blanca).
color(verde).
color(roja).
color(azul).
bebida(agua).
bebida(cafe).
bebida(leche).
bebida(te).
mascota(gato).
mascota(perro).
mascota(pez).
mascota(loro).
vive_en(ana, 1).
vive_en(beto, 2).
vive_en(carla, 3).
vive_en(diego, 4).
color_casa(1, blanca).
color_casa(2, verde).
color_casa(3, roja).
color_casa(4, azul).
bebe(ana, agua).
bebe(beto, cafe).
bebe(carla, leche).
bebe(diego, te).
tiene(ana, gato).
tiene(beto, perro).
tiene(carla, pez).
tiene(diego, loro).

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

 resumen_pez(P, N, Color, Bebida) :-
    vive_en(P, N),
    color_casa(N, Color),
    bebe(P, Bebida),
    tiene(P, pez).
