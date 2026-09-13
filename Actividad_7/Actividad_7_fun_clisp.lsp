;;; Areas

;; Area del cubo
(defun a_cubo(l)
(* 6 (expt l 2)))

;; Area de un cuadrado
(defun a_cuadrado (l)
(* l l))

;; Area de un rectangulo
(defun a_rectangulo(b h)
(* b h))

;;Area de un pentagono
(defun a_pentagono (p a)
(/ (* p a) 2))

;;Area de un rombo
(defun a_rombo(d_ma d_me)
(/ (* d_ma d_me) 2))

;;Area de un romboide
(defun a_romboide(b h)
(* b h))

;;Area de un trapecio
(defun a_trapecio(b_ma b_me h)
(/ (* (+ b_ma b_me) h) 2))

;;Area de un triangulo
(defun a_triangulo(b h)
(/ (* b h) 2))

;;Area de un circulo
(defun a_circulo(r)
(* pi (expt r 2)))

;;Area de un cilindro
(defun a_cilindro(r h)
(* 2 pi r (+ r h)))

;;; Volumen

;;Volumen de un cubo
(defun v_cubo(l)
(* l l l ))

;;Volumen de un prisma
(defun v_prisma(a_b h)
(* a_b h))

;;Volumen de una piramide
(defun v_piramide(a_b h)
(* (/ 1 3) a_b h))

;;Volumen de un cilindro
(defun v_cilindro(r h)
(* pi (* r r) h))

;;Volumen de un cono
(defun v_cono(r h)
(* (/ 1 3) pi (* r r) h))

;;Volumen de una esfera
(defun v_esfera(r)
(* (/ 4 3) pi (* r r r)))

;;Volumen de un paralelepipido
(defun v_paralelepipido(a b c)
(* a b c))

;;Volumen de un tetraedro
(defun v_tetraedro(a)
(* (/ (* a a a) 12) (sqrt 2)))

;;Volumen de un octaedro
(defun v_octaedro(a)
(* (/ (* a a a) 3) (sqrt 2)))

;;Volumen de una piramide truncada
(defun v_p_truncada(b_ma b_me h)
(* (/ h 3) (+ b_ma b_me (sqrt (* b_ma b_me)))))