(format t "Calculo de volumnes y Areas con funciones Lambda~%~%")
(defun aplicar-operacion (operacion lista texto)
    ;;(mapcar operacion lista)
    (format t "~A: ~A~%" texto (apply operacion lista)) 
)

;; Area del cubo
(aplicar-operacion (lambda (x) (* 6 (expt x 2)) ) '(5) "Area del cubo")
;; Area del cuadrado 
(aplicar-operacion (lambda (x) (* x x)) '(5) "Area del cuadrado")
;; Area del rectangulo
(aplicar-operacion (lambda (x y) (* x y)) '(8 4) "Area del rectangulo")
;; Area del pentagono
(aplicar-operacion (lambda (x y) (/ (* x y) 2)) '(20 6) "Area del pentagono")
;; Area del rombo 
(aplicar-operacion (lambda (x y) (/ (* x y) 2)) '(10 6) "Area del rombo")
;; Area del romboide 
(aplicar-operacion (lambda (x y) (* x y)) '(8 5) "Area del romboide")
;; Area del trapecio
(aplicar-operacion (lambda (x y z) (/ (* (+ x y) z) 2)) '(10 6 4) "Area del trapecio")
;; Area del triangulo
(aplicar-operacion (lambda (x y) (/ (* x y) 2)) '(10 6) "Area del triangulo")
;; Area del circulo
(aplicar-operacion (lambda (x) (* pi (expt x 2))) '(5) "Area del circulo")
;; Area de cilindro
(aplicar-operacion (lambda (x y) (* 2 pi x (+ x y))) '(3 5) "Area del cilindro")

(format t "~%")
;; Volumen del cubo 
(aplicar-operacion (lambda (x) (* x x x)) '(5) "Volumen del cubo")
;; Volumen de prisma
(aplicar-operacion (lambda (x y) (* x y)) '(20 5) "Volumen del prisma")
;; Volumen de piramide
(aplicar-operacion (lambda (x y) (* (/ 1 3) x y)) '(30 6) "Volumen del piramide")
;; Volumen de cilindro
(aplicar-operacion (lambda (x y) (* pi (* x x) y)) '(3 5) "Volumen del cilindro")
;; Volumen de cono
(aplicar-operacion (lambda (x y) (* (/ 1 3) pi (* x x) y)) '(3 6) "Volumen del cono")
;; Volumen de esfera
(aplicar-operacion (lambda (x) (* (/ 4 3) pi (* x x x))) '(3) "Volumen de la esfera")
;; Volumen de paralelepipido
(aplicar-operacion (lambda (x y z) (* x y z)) '(4 5 6) "Volumen del paralelepipido")
;; Volumen de tetraedro
(aplicar-operacion (lambda (x) (* (/ (* x x x) 12) (sqrt 2))) '(6) "Volumen del tetraedro") 
;; Volumen de octaedro
(aplicar-operacion (lambda (x) (* (/ (* x x x) 3) (sqrt 2))) '(6) "Volumen del octaedro")
;; Volumen de piramide truncada
(aplicar-operacion (lambda (x y z) (* (/ z 3) (+ x y (sqrt (* x y))))) '(16 4 6) "Volumen de la piramide truncada")