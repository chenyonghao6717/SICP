; import lib/collection.scm

(define (unique-pairs n)
  (if (< n 2)
      '()
      (flatmap
        (lambda (i)
          (map (lambda (j) (list j i)) (enumerate 1 (- i 1))))
        (enumerate 2 n))))

(display (unique-pairs 10))
(newline)