(define (make-point x y) (cons x y))

(define (make-segment x1 y1 x2 y2)
  (cons (make-point x1 y1) (make-point x2 y2))
)

(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (print-point point)
  (newline)
  (display "(")
  (display (x-point point))
  (display ", ")
  (display (y-point point))
  (display ")")
)

(define (mid-point segment)
  (define average (lambda (x y) (/ (+ x y) 2)))
  (define average-coordinate 
    (lambda (selector segment) 
      (average (selector (start-segment segment)) 
               (selector (end-segment segment))
      )
    )
  )
  (make-point (average-coordinate x-point segment)
              (average-coordinate y-point segment)
  )
)

(print-point 
  (let ((segment (make-segment 1 1 2 2)))
    (mid-point segment)
  )
)