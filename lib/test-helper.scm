(define (assert-equal expected actual)
  (define (display-all items) (for-each display items))
  (if (equal? expected actual)
      (display-all (list expected " passed\n"))
      (begin (display "FAIL: expected ")
             (write expected)
             (display ", got ")
             (write actual)
             (newline))
  )
)

(define (pair-comparator p1 p2)
  (or
    (< (car p1) (car p2))
    (and (= (car p1) (car p2)) (< (cadr p1) (cadr p2)))
  )
)

(define (triple-comparator t1 t2)
  (or
    (< (car t1) (car t2))
    (and (= (car t1) (car t2)) (pair-comparator (cdr t1) (cdr t2)))
  )
)

(define (list-comparator l1 l2)
  (if (null? l1)
      #t
      (or
        (< (car l1) (car l2))
        (and
          (= (car l1) (car l2))
          (list-comparator (cdr l1) (cdr l2))
        )
      )
  )
)