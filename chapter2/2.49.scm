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
(define wave-painter
  (segment-painter
    (list
      (make-segment (make-vect 0 0) (make-vect 0.25 0.25))
      (make-segment (make-vect 0.25 0.25) (make-vect 0.5 0))
      (make-segment (make-vect 0.5 0) (make-vect 0.75 0.25))
      (make-segment (make-vect 0.75 0.25) (make-vect 1 0))
    )
  )
)