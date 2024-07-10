; import lib/collection.scm

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (node)
                           (cond ((null? node) 0)
                                 ((not (pair? node)) 1)
                                 (else (count-leaves node))))
                   t)))

(display (count-leaves (list (list 1) (list 2 3) (list 4))))
(newline)
(display (count-leaves (list (list 1) (list 2) (list 3))))
(newline)