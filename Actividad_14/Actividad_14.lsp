(defun aplicar-operacion (operacion lista)
    (mapcar operacion lista)
    (apply operacion lista)
)

;; Area del cubo
(aplicar-operacion (lambda (x) (*6 (expt x 2)) ) '(5))
;; Area del cuadrado 
(aplicar-operacion (lambda (x) (* x x)) '(5))
;; Area del rectangulo
;;(aplicar-operacion (lambda (x y) (* x y)) '(8 4))
;; Area del pentagono
(aplicar-operacion (lambda (x y) (/ (* x y) 2)) '(20 6))
;; Area del rombo 
;;(aplicar-operacion (lambda (x y) (/ (* x y) 2)) '(10 6))
;; Area del romboide 
;;(aplicar-operacion (lambda (x y) (* x y)) '(8 5))
;; Area del trapecio
(aplicar-operacion (lambda (x y z) (/ (* (+ x y) z) 2)) '(10 6 4))
;; Area del triangulo
(aplicar-operacion (lambda (x y) (/ (* b h) 2)) '(10 6))
;; Area del circulo
(aplicar-operacion (lambda (x) (* pi (expt x 2))) '(5))
;; Area de cilindro
(aplicar-operacion (lambda (x y) (* 2 pi x (+ x y))) '(3 5))

;; Volumen de 
(aplicar-operacion (lambda ) '())
