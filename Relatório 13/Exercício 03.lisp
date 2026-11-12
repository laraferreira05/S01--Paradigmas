(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (let ((nova-escuridao (- (garota-magica-escuridao g) quantidade)))
    (make-garota-magica
     :nome (garota-magica-nome g)
     :escuridao (if (< nova-escuridao 0) 0 nova-escuridao)
     :bruxas (garota-magica-bruxas g))))

(defun main ()
  (let* ((grupo-inicial (list
                         (make-garota-magica :nome "Madoka" :escuridao 20 :bruxas 5)
                         (make-garota-magica :nome "Sayaka" :escuridao 60 :bruxas 3)
                         (make-garota-magica :nome "Homura" :escuridao 10 :bruxas 15)))
         
         (grupo-novo (cons (make-garota-magica :nome "Mami" :escuridao 40 :bruxas 8)
                           grupo-inicial)))
    
    (format t "Escuridao total do grupo inicial: ~a~%" (escuridao-total grupo-inicial))
    (format t "Total de bruxas derrotadas: ~a~%" (total-de-bruxas grupo-inicial))
    
    (format t "Escuridao total com a nova garota: ~a~%" (escuridao-total grupo-novo))
    (format t "O catalogo original continua com escuridao: ~a~%" (escuridao-total grupo-inicial))
    
    (let ((sayaka-limpa (purifica (cadr grupo-inicial) 50)))
      (format t "Escuridao da Sayaka original: ~a~%" (garota-magica-escuridao (cadr grupo-inicial)))
      (format t "Escuridao da Sayaka apos purificar: ~a~%" (garota-magica-escuridao sayaka-limpa)))))

(main)
