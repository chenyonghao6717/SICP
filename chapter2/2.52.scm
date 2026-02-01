; a: by adding a new shape like: v as the smile

; b
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let (
          (up (up-split painter (- n 1)))
          (right (right-split painter (- n 1)))
        )
        (beside
          (below painter up)
          (below right (corner-split painter (- n 1))))
      )
  )
)

; c
(define 
  (square-limit painter n)
  (let (
      (quarter (corner-split painter n))
    )
    (let (
        (top (beside quarter (flip-horiz quarter)))
        (bottom (beside (flip-vert quarter) (rotate180 quarter)))
      )
      (below top bottom)
    )
  )
)