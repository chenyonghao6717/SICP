; slow version
(flatmap
  (lambda (new-row)
    (map (lambda (rest-of-queens)
      (adjoin-position new-row k rest-of-queens))
    (queen-cols (- k 1)))) ; -> this recursive call is executed by board-size times
  (enumerate-interval 1 board-size))

; original version
(flatmap
  (lambda (rest-of-queens)
    (map (lambda (new-row)
      (adjoin-position
      new-row k rest-of-queens))
    (enumerate-interval 1 board-size)))
  (queen-cols (- k 1))) ; only executed once for all board-size 