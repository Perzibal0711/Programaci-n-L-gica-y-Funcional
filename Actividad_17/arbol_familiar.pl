padre(jose).
padre(luis).
padre(ramiro).
madre(maria).
madre(julisa).
madre(guadalupe).
madre(liz).
madrede(maria, pedro).
madrede(maria, jose).
madrede(julisa, ramiro).
madrede(julisa, ramiro).
madrede(guadalupe, erik).
padrede(julio, pedro).
padrede(pedro, luis).
padrede(jose, guadalupe).
padrede(eduardo, ramiro).
padrede(julio, josefo).
padrede(eduardo, luis).
padrede(ramiro, juana).
abuelo(X,Y):-padrede(X,Z), padrede(Z,Y); padrede(X,Z), madrede(Z,Y).
abuela(X,Y):-madrede(X,Z), madrede(Z,Y); madrede(X,Z), padrede(Z,Y).
abuelos(X,Y) :- abuelo(X,Y) ; abuela(X,Y).