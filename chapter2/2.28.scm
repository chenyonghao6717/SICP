(define (fringe tree)
  (if (null? tree)
      tree
      (append
        (if (pair? (car tree)) 
            (fringe (car tree)) 
            (list (car tree)))
        (fringe (cdr tree)))))
(define tree1 (list (list 1 2) (list 3 4)))
(define tree2 (list tree1 tree1))
(display (fringe tree1))
(newline)
(display (fringe tree2))
(newline)