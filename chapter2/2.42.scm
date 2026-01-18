(load "../lib/collection.scm")
(load "../lib/test-helper.scm")

(define (safe? k positions)
  (define (conflict? row col rest next-col)
    (if (null? rest)
        #f
        (let ((next-row (car rest)))
          (or
            ; in the same row
            (= row next-row)
            ; in the same diagonal
            (=
              (abs (- next-row row))
              (abs (- next-col col))
            )
            (conflict? row col (cdr rest) (+ next-col 1))
          )
        )
    )
  )
  (not (conflict? (car positions) k (cdr positions) (+ k 1)))
)


(define (queens board-size)
  (define empty-board '())

  (define (adjoin-position new-row k rest-of-queens)
    (cons new-row rest-of-queens)
  )
  
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter 
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map
                (lambda (new-row) (adjoin-position new-row k rest-of-queens))
                (enumerate-interval 1 board-size)
              )
            )
            (queen-cols (- k 1))
          )
        )
    )
  )
  (queen-cols board-size)
)

(assert-equal '((2 4 1 3) (3 1 4 2)) (sort list-comparator (queens 4)))