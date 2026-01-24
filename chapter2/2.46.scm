(define make-vect (lambda (x y) (cons x y)))

(define xcor-vect (lambda (vect) (car vect)))
(define ycor-vect (lambda (vect) (cdr vect)))

(define (add-vect x y)
  (make-vect
    (+ (xcor-vect x) (xcor-vect y))
    (+ (ycor-vect x) (ycor-vect y))
  )
)


(define (sub-vect x y)
  (make-vect
    (- (xcor-vect x) (xcor-vect y))
    (- (ycor-vect x) (ycor-vect y))
  )
)

(define (scale-vect s vect)
  (make-vect
    (* s (xcor-vect vect))
    (* s (ycor-vect vect))
  )
)