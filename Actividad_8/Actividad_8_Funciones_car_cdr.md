### De la lista `(car '(1 2 3 4 5 6 7 8 9 10))` optener el 6, 8 y 10

#### Optencion del 6 `(cadr (cddddr '(1 2 3 4 5 6 7 8 9 10)))`

![Imagen](OP-A.png)

#### Optencion del 8 `(cadddr (cddddr '(1 2 3 4 5 6 7 8 9 10)))`

![Imagen](OP-8.png)

#### Optencion del 10 `(cadr (cddddr (cddddr '(1 2 3 4 5 6 7 8 9 10))))`

![Imagen](OP-10.png)

### De la lista `(1 2 (3 4) (A B C D))`

#### Optencion de la D `(cadddr (cadddr '(1 2 (3 4) (A B C D))))`

![Imagen](OP-D.png)

#### Optencion de la C `(caddr (cadddr '(1 2 (3 4) (A B C D))))`

![Imagen](OP-C.png)

#### Optencion del 4 `(cadr (caddr '(1 2 (3 4) (A B C D))))`

![Imagen](OP-4.png)

#### Optencion del 2 `(cadr '(1 2 (3 4) (A B C D)))`

![Imagen](OP-2.png)

#### Optencion de la A `(car (cadddr '(1 2 (3 4) (A B C D))))`

![Imagen](OP-A.png)

### De la lista `((A B C) (R (T X) (Z W)))`

#### Optencion de la W `(cadr (caddr (cadr '((A B C) (R (T X) (Z W))))))`

![Imagen](OP-W.png)

#### Optencion de la Z `(caaddr (cadr '((A B C) (R (T X) (Z W)))))`

![Imagen](OP-Z.png)

#### Optencion de la T `(caadr (cadr '((A B C) (R (T X) (Z W)))))`

![Imagen](OP-T.png)

#### Optencion de la R `(caadr '((A B C) (R (T X) (Z W))))`

![Imagen](OP-R.png)

#### Optencion de la X `(cadadr (cadr '((A B C) (R (T X) (Z W)))))`

![Imagen](OP-X.png)

#### Optencion de la A `(caar '((A B C) (R (T X) (Z W))))`

![Imagen](OP_A.png)

### De la lista `((((a b) (c d) (f g))))`

#### Optencion de la A `(caaaar '((((a b) (c d) (f g)))))`

![Imagen](OP--A.png)

#### Optencion de la B `(cadr (caaar '((((a b) (c d) (f g))))))`

![Imagen](OP-B.png)

#### Optencion de la C `(caadr (caar '((((a b) (c d) (f g))))))`

![Imagen](OP_C.png)

#### Optencion de la D `(cadr (cadr (caar '((((a b) (c d) (f g)))))))`

![Imagen](OP_D.png)

#### Optencion de la F `(caaddr (caar '((((a b) (c d) (f g))))))`

![Imagen](OP-F.png)

#### Optencion de la G `(cadadr (cdr (caar '((((a b) (c d) (f g)))))))`

![Imagen](OP-G.png)
