;;; (nombre edad nivel base puntos)
(setq *agentes*
      '((ana    28 3 morelia   120)
        (beto   35 5 uruapan   340)
        (carla  22 1 morelia    45)
        (diego  41 4 zamora    210)
        (elena  30 2 patzcuaro  90)
        (fausto 26 5 morelia   400)))

(setq *alfabeto* '(a b c d e f g h i j k l m n o p q r s t u v w x y z))

;;; mensaje cifrado: una sublista por palabra
(setq *interceptado*
      '((22 20 3 11 6 17 20)
        (16 11 24 7 14)
        (5 11 16 5 17)
        (8 23 7 20 3)
        (6 7)
        (15 17 20 7 14 11 3)))

(setq *bonos* '(10 0 5 20 15 0))

;; Mision 1
(defun nombre (ag) 
  (car ag)
)

(defun edad   (ag) 
  (car (cdr ag))
)

(defun nivel  (ag) 
  (car (cdr (cdr ag)))
)

(defun base   (ag) 
  (car (cdr (cdr (cdr ag))))
)

(defun puntos (ag) 
  (car (cdr (cdr (cdr (cdr ag)))))
)

(defun puntos_elena (ag)
  (car (cdr (cdr (cdr (cdr (car (cdr (cdr (cdr (cdr ag))))))))))
)

;; Mision 2

(defun pase-de-lista (agentes)
  (mapcar #'nombre agentes)
)

(defun nombre-y-nivel (agentes)
  (mapcar (lambda (agente) (cons (nombre agente) (nivel agente))) agentes)
)

(defun cumpleanios (agentes)
  (mapcar (lambda (agente) (list (nombre agente) (+ 1 (edad agente)))) agentes)
)

(defun aplicar-bonos (agentes bonos)
  (mapcar (lambda (agente bono) (+ (puntos agente) bono)) agentes bonos)
)

;; Mision 3

(defun descifrar-codigo (numero)
  (nth (mod (- numero 3) 26) *alfabeto*)
)

(defun descifrar-palabra (palabra)
  (mapcar #'descifrar-codigo palabra)
)

(defun descifrar-mensaje (mensaje)
  (mapcar #'descifrar-palabra mensaje)
)

(defun descifrar-mensaje-2 (interceptado)
  (mapcar (lambda (lista) (mapcar (lambda (i) (nth (mod (- i 3) 26) *alfabeto*)) lista)) interceptado)
)

(defun cifrar-mensaje (mensaje)
  (mapcar (lambda (palabra) (mapcar (lambda (letra) (mod (+ (position letra *alfabeto*) 3) 26)) palabra)) mensaje)
)

;; Mision 4

(defun sospechosos (traidor)
  (remove nil (mapcar (lambda (agente) (if (and (= (nivel agente) (car traidor)) (not (string-equal (base agente) (car (cdr traidor))))) (nombre agente) nil)) *agentes*))
)

(defun leales (agentes traidor)
  (remove nil (mapcar (lambda (agente) (if (string-equal (nombre agente) traidor) nil agente)) agentes))
)

(defun total-puntos (agentes)
  (reduce #'+ (mapcar #'puntos agentes))
)

(defun promedio-edad ()
  (let ((edades (mapcar #'edad (leales *agentes* "beto")))) (/ (reduce #'+ edades) (float (length edades))))
)

;; Mision 6

(defun filtro-nivel (minimo)
  (lambda (agente) (>= (nivel agente) minimo))
)

(defun filtro-base (ciudad)
  (lambda (agente) (equal (base agente) ciudad))
)

(defun y-filtros (f1 f2)
  (lambda (agente) (and (funcall f1 agente) (funcall f2 agente)))
)

(defun aplicar-filtro (filtro agentes)
  (remove nil (mapcar (lambda (agente) (if (funcall filtro agente) agente nil)) agentes))
)

(defun informe (agentes)
  (mapcar 
    (lambda 
      (agente) 
      (format t "~A edad: ~A (~A) nivel: ~A -> puntos: ~A~%" (nombre agente) (edad agente) (base agente) (nivel agente) (puntos agente))
    ) agentes) (length agentes)
)

;(defun informe (agentes)
;  (mapcar 
;    (lambda 
;      (agente) 
;      (format t "~A | edad: ~A | nivel: ~A | base: ~A | puntos: ~A~%" (nombre agente) (edad agente) (nivel agente) (base agente) (puntos agente))
;    ) agentes) (length agentes)
;)

