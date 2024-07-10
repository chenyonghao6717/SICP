; import lib/collection.scm

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                      (+ (* higher-terms x) this-coeff))
              0
              coefficient-sequence))

(display (horner-eval 2 (list 1 2 3 4)))
(newline)