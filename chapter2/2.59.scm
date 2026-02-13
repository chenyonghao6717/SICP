(load "../lib/test-helper.scm")
(load "../lib/collection.scm")

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2) set2)
        (else (cons (car set1) (union-set (cdr set1) set2)))
  )
)

(display (list-comparator '(1 2 3 4 5 6) (union-set '(1 2 3) '(4 5 6))))