(defun imprimir(lista)
    (if lista
        (print (car lista))
    )
    (if lista
        (imprimir (cdr lista))
    )
)

(defun recorre (lista)
    (format t "~A~% ->" (car lista))
    (if lista 
        (recorre (cdr lista))
        (format t "Es el final ")
    )
)