; import lib/collection.scm

(define (fold-right op initial seq)
  (accumulate op initial seq))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
; 3 / 2
(fold-left / 1 (list 1 2 3))
; 1 / 6
(fold-right list '() (list 1 2 3))
; (1 (2 (3)))
(fold-left list '() (list 1 2 3))
; (((1) 2 ) 3)

; fold-right and fold-left produce same values only if the operands of op are exchangable like '+', '*'