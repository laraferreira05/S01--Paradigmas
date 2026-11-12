(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peixe Peepers" :bioma "Pradarias Seguras" :profundidade 10 :perigo :inofensiva)
   (make-criatura :nome "Tubarao Enguia" :bioma "Grandes Arrecifes" :profundidade 150 :perigo :agressiva)
   (make-criatura :nome "Leviatan Reaper" :bioma "Dunas" :profundidade 80 :perigo :leviata)
   (make-criatura :nome "Bojudo" :bioma "Flutuantes" :profundidade 5 :perigo :inofensiva)))

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva  "Agressiva")
    (:leviata    "Leviatan: mantenha distancia")
    (otherwise   "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a (~a) - Profundidade: ~am - Perigo: ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defun main ()
  (format t "--- Catalogo Inteiro ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))
  
  (format t "~%--- Criaturas abaixo de 50 metros ---~%")
  (let ((fundas (abaixo-de 50 *catalogo*)))
    (dolist (texto (mapcar #'descreve-criatura fundas))
      (format t "~a~%" texto))
    (format t "Total de criaturas abaixo de 50m: ~a~%" (length fundas))))

(main)
