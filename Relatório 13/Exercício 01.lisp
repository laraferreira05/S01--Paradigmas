(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (e)
  (cond ((>= (erva-toxicidade e) 7) "veneno")
        ((>= (erva-toxicidade e) 4) "use com cuidado")
        (t "segura")))

(defun preco-da-dose (e gramas)
  (* (erva-preco-por-grama e) gramas))

(defun descreve-erva (e)
  (format nil "~a - R$~,2f por grama - Classificacao: ~a"
          (erva-nome e)
          (erva-preco-por-grama e)
          (classifica-erva e)))

(defun aviso (e)
  (if (>= (erva-toxicidade e) 7)
      "Aviso: Maomao vai testar a erva em si mesma antes!"
      "Liberada para o paciente."))

(defun main ()
  (let ((estoque (list
                  (make-erva :nome "Flor de Ginseng" :preco-por-grama 5.50 :toxicidade 2)
                  (make-erva :nome "Raiz de Jixie" :preco-por-grama 12.00 :toxicidade 5)
                  (make-erva :nome "Po de Suikan" :preco-por-grama 25.00 :toxicidade 9))))
    
    (format t "--- Farmacia da Maomao ---~%")
    (dolist (e estoque)
      (format t "~a~%" (descreve-erva e))
      (format t "~a~%~%" (aviso e)))
    
    (format t "Preco de 10 gramas de Raiz de Jixie: R$~,2f~%"
            (preco-da-dose (cadr estoque) 10))))

(main)
