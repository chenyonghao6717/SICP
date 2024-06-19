; import lib/common-math.scm

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list items)
  (map square items))

(display (square-list (list 1 2 3)))
(newline)