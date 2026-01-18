(load "../lib/collection.scm")
(load "../lib/test-helper.scm")

(define (unique-pairs n)
  (if (< n 2)
      '()
      (flatmap
        (lambda (i)
          (map (lambda (j) (list j i)) (enumerate-interval 1 (- i 1))))
        (enumerate-interval 2 n))))

(assert-equal '((1 2) (1 3) (2 3)) (unique-pairs 3))
