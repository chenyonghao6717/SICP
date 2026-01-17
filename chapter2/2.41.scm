(load "../lib/collection.scm")
(load "../lib/test-helper.scm")
(load "../lib/math.scm")

; add i for pair (j k)
(define (find-triples n s)
  (define (gen-triples pair)
    (map 
      (lambda (i) (cons i pair))
      (enumerate 1 (- s (sum pair)))
    )
  )

  (define (valid? triple)
    (let 
      (
        (i (car triple))
        (j (cadr triple))
        (k (caddr triple))
      )
      (and
        (< i j)
        (< j k)
        (or (> i 0) (= i 0))
        (or (< k n) (= k n))
        (= s (+ i j k))
      )
    )
  )

  (define (gen-pairs k)
    (map
      (lambda (j) (list j k))
      (enumerate 2 (- k 1))
    )
  )

  (let* 
    (
      (pairs (flatmap gen-pairs (enumerate 3 n)))
      (triples (flatmap gen-triples pairs))
    )
    (filter valid? triples)
  )
)



(assert-equal
  '((1 2 7) (1 3 6) (1 4 5) (2 3 5))
  (sort triple-comparator (find-triples 10 10)))