(defparameter *one-piece*
  '("One Piece"
    ("Gobierno"
      ("Rey"
        "Inmu"
      )
      ("Gorosey"
        ("Vivo"
          ("Actuales"
            "San Ethanbaron V. Nusjuro"
            "San Shepherd Ju Peter"
            "San Topman Warcury"
            "San Marcus Mars")
          ("Nuevo"
            "San Figarland Garling")
        )
        ("Muerto"
          "San Jaygarcia Saturn")
      )
      ("Marina"
        ("Almirante supremo"
          ("Antiguo"
            "Sengoku")
          ("Nuevo"
            "Akainu")
        )
        ("Almirante"
          ("Originales"
            "Kuzan \"Ao kiji\""
            "Sakazuki \"Aka Inu\""
            "Borsalino \"ki Saru\"")
          ("Nuevos"
            "Issho \"Fijitora\""
            "Aramaki \"Ryokugu\"")
        )
        ("Vicealmirante"
          "Monkey D. Garp"
          "Tsuru")
        ("Capitan"
          "Smoker"
          "Hina")
        ("Subordinados"
          "Coby"
          "Helmeppo"
          "Tashigi"
          "Jango"
          "Fullbody")
      )
      ("Shichibukai"
        ("Hombre"
          "Cocodrile"
          "Gecko Moria"
          "Doflamingo"
          "Dracule Mihawk"
          "Jimbe"
          "Bartholomew Kuma"
          "Marshall D. Teach"
          "Edward Weevil"
          "Trafalgar D. Water Law"
          "Buggy")
        ("Mujer"
          "Boa Hancock")
      )
    )
    ("Pirata"
      ("Peor generacion"
        ("Mujer"
          "Jewelry Bonney")
        ("Hombre"
          "Monkey D. Luffy"
          "Roronoa Zoro"
          "Marshall D. Teach"
          "Trafalgar D. Water Law"
          "Eustass Kid"
          "Killer"
          "Urouge"
          "Capone Bege"
          "Scratchmen Apoo"
          "Basil Hawkins"
          "x Drake")
      )
      ("Younkos"
        ("Anteriores"
          "Charlotte Linlin"
          "Kaidou"
          "Edward Newgate")
        ("Actuales"
          "Shanks"
          "Monkey D. Luffy"
          "Buggy"
          "Marshall D. Teach")
      )
      ("Sombrero de paja"
        ("Tiene fruta del diablo"
          ("Mujer"
            "Nico Robin")
          ("Hombre"
            "Monkey D. Luffy"
            "Tony Tony Chopper"
            "Brook")
        )
        ("No tiene fruta del diablo"
          ("Mujer"
            "Nami")
          ("Hombre"
            "Roronoa Zoro"
            "Sanji"
            "Franky"
            "Jimbe"
            "Usopp")
        )
      )
      ("Rey de los piratas"
        ("Vivo"
          "Silvers Rayleigh"
          "Scopper Gaban"
          "Shanks"
          "Buggy"
          "Crocus"
        )   
        ("Muerto"
          "Gol D. Roger"
          "Kozuki Oden"
        )
      )
    )
    ("D"
      ("Hombre"
        ("vivo"
          "Monkey D. Luffy"
          "Marshall D. Teach"
          "Jaguar D. Saul"
          "Monkey D. Dragon"
          "Monkey D. Garp"
          "Trafalgar D. Water Law"
        )
        ("Muerto"
           "Gol D. Roger"
           "Portgas D. Ace"
           "Rocks D. Xebec"
           "Nefertari D. Cobra"
           "Clou D. Clover"
           "Davy D. Jones"
        )
      )
      ("Mujer"
        ("vivo"
          "Nefertari D. Vivi"
        )
        ("Muerto"
           "Portgas D. Rouge"
           "Nefertari D. Lili"
        )
      )
    )
  )
)

;; Akinator de One Piece
(defun recorrer-hijos (hijos)
  (cond
    ((null hijos) nil)
    ((akinator (car hijos)) t)
    (t (recorrer-hijos (cdr hijos)))
  )
)

(defun akinator (arbol)
  (cond
    ((stringp arbol)
     (format t "¿Tu personaje es ~a? (s/n): " arbol)
     (string-equal (read-line) "s")
    )
    (t
      (format t "¿Tu personaje pertenece a ~a? (s/n): " (car arbol))
      (if (string-equal (read-line) "s")
         (recorrer-hijos (cdr arbol))
         (progn
           (format t "Entonces no pertenece a ~a.~%" (car arbol))
           nil
         )
      )
    )
  )
)

