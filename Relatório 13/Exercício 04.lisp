(defstruct dominio
  nome
  elemento ; keyword ex: :pyro, :hydro, :electro, etc.
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro   1.2)
    (otherwise 1.0)))

(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

(defun exibe-recompensa (d)
  (format nil "~a (~a) - Mora Final: R$~,2f"
          (dominio-nome d)
          (dominio-elemento d)
          (recompensa-final d)))

(defun rota (lista dificuldade-maxima)
  (let* ((filtrados (remove-if-not (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                                   lista))
         (textos (mapcar #'exibe-recompensa filtrados)))
    textos))

(defun main ()
  (let ((dominios (list
                   (make-dominio :nome "Jardim do Outono" :elemento :electro :dificuldade 3 :mora 10000)
                   (make-dominio :nome "Vale da Lembranca" :elemento :pyro :dificuldade 4 :mora 15000)
                   (make-dominio :nome "Fenda Abissal" :elemento :hydro :dificuldade 2 :mora 8000)
                   (make-dominio :nome "Altar da Chama" :elemento :pyro :dificuldade 5 :mora 20000)
                   (make-dominio :nome "Torre do Vento" :elemento :anemo :dificuldade 1 :mora 5000))))
    
    (format t "--- Rota para Dificuldade Maxima 3 ---~%")
    (dolist (t-rota (rota dominios 3))
      (format t "~a~%" t-rota))
    
    (format t "~%Total de mora da lista inteira: R$~,2f~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))
    
    (format t "~%--- Testando setf em copia ---~%")
    (let ((copia (copy-dominio (car dominios))))
      (setf (dominio-mora copia) 99999)
      (format t "Mora da copia alterada: R$~,2f~%" (dominio-mora copia))
      (format t "Mora do original continua igual: R$~,2f~%" (dominio-mora (car dominios))))))

(main)
