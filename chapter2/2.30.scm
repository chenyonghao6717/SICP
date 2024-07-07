; import lib/math.scm

(define (square-tree-directly tree)
  (define (square-first list_)
    (let ((first (car list_)))
      (if (pair? first)
          (square-tree-directly first)
          (square first))))
  (if (null? tree)
      '()
      (cons (square-first tree) (square-tree-directly (cdr tree)))))

(define (square-tree-high-order tree)
  (map
    (lambda (x) (cond ((null? x) '())
                      ((pair? x) (square-tree-high-order x))
                      (else (square x))))
    tree))

(define tree
  (list 1
        (list 2
              (list 3 4)
              5)
        (list 6 7)))

(display  tree)
(newline)
(display (square-tree-directly tree))
(newline)
(display (square-tree-high-order tree))
(newline)