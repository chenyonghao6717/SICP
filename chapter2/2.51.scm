(load "2.50.scm")

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let
      (
        (paint-left
          (transform-painter
            painter1
            (make-vect 0.0 0.0)
            split-point
            (make-vect 0.0 1.0)
          )
        )
        (paint-right
          (transform-painter
            painter2
            split-point
            (make-vect 1.0 0.0)
            (make-vect 0.5 1.0)
        )
      )
    )
    (lambda (frame) (paint-left frame) (paint-right frame))
    )
  )
)

(define (below1 painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let
      (
        (paint-low 
          (transform-painter
            painter1
            (make-vect 0.0 0.0)
            split-point
            (make-vect 1.0 0.0)
          )
        )
        (paint-up 
          (transform-painter
            painter2
            split-pointer
            (make-vect 1.0 0.5)
            (make-vect 0.0 1.0)
          )
        )
      )
      (lambda (frame) (paint-low frame) (paint-high frame))
    )
  )
)

(define (below2 painter1 painter2)
  (let
    (
      (new-painter1 (rotate-270 painter1))
      (new-painter2 (rotate-270 painter2))
    )
    (beside new-painter1 new-painter2)
  )
)