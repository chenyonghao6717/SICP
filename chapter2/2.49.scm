(load "2.48.scm")

; The painter that draws the outline of the designated frame
(define outline->painter
  (segment->painter 
    (list
      (make-segment (make-vect 0 0) (make-vect 1 0))
      (make-segment (make-vect 0 0) (make-vect 0 1))
      (make-segment (make-vect 1 0) (make-vect 1 1))
      (make-segment (make-vect 0 1) (make-vect 1 1))
    )
  )
)

; The painter that draws an “X” by connecting opposite corners of the frame
(define x-painter
  (segment->painter
    (list
      (make-segment (make-vect 0 0) (make-vect 1 1))
      (make-segment (make-vect 1 0) (make-vect 0 1))
    )
  )
)

; The painter that draws a diamond shape by connecting the midpoints of the sides of the frame
(define diamond-painter
  (segment-painter
    (list
      (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
      (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
      (make-segment (make-vect 0.5 1) (make-vect 0 0.5))
      (make-segment (make-vect 0 0.5) (make-vect 0.5 0))
    )
  )
)

; The wave painter
(define wave
  (segments->painter
    (list 
      (make-segment (make-vect 0.00 0.50) (make-vect 0.20 0.70))
      (make-segment (make-vect 0.20 0.70) (make-vect 0.40 0.60))
      (make-segment (make-vect 0.40 0.60) (make-vect 0.60 0.80))
      (make-segment (make-vect 0.60 0.80) (make-vect 0.75 0.60))
      (make-segment (make-vect 0.75 0.60) (make-vect 1.00 0.70))
      (make-segment (make-vect 0.40 0.00) (make-vect 0.60 0.20))
      (make-segment (make-vect 0.60 0.20) (make-vect 0.80 0.00))
    )
  )
)