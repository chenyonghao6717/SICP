(define square (lambda (x) (* x x)))
(define square-sum (lambda (x y) (+ (square x) (square y))))
(define square-sum-root (lambda (x y) (sqrt (square-sum x y))))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment point1 point2) (cons point1 point2))
(define (start-point segment) (car segment))
(define (end-point segment) (cdr segment))

(define (segment-length segment) 
  (define (substract selector segment) (- (selector (start-point segment)) (selector (end-point segment))))
  (square-sum-root (substract y-point segment) (substract x-point segment))
)

(define (make-rectangle-1 x1 y1 x2 y2 x3 y3)
  (let 
    (
      (point1 (make-point x1 y1))
      (point2 (make-point x2 y2))
      (point3 (make-point x3 y3))
    )
    (let 
      (
        (segment1 (make-segment point1 point2))
        (segment2 (make-segment point1 point3))
      )
      (cons segment1 segment2)
    )
  )
)

(define (get-segment1 rectangle) (car rectangle))
(define (get-segment2 rectangle) (cdr rectangle))

(define (perimeter rect)
  (* 2 
     (+ (segment-length (get-segment1 rect))
        (segment-length (get-segment2 rect))
     )
  )
)

(define (area rect)
  (* (segment-length (get-segment1 rect))
     (segment-length (get-segment2 rect))))