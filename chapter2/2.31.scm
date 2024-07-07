; import lib/math.scm
; import lib/collection.scm

(define (square-tree tree) (tree-map square tree))

(define tree (list 1 (list 2 3) (list 4)))
(display (square-tree tree))
(newline)