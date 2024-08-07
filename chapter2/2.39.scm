; import chapter2/2.38.scm

(define seq (list 1 2 3 4))

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))
(display (reverse seq))
(newline)

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
(display (reverse seq))
(newline)