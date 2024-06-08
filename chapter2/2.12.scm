; import chapter2/2.7.scm

(define (make-center-percent center percentage)
  (make-interval
    (* center (/ (- 100 percentage) 100))
    (* center (/ (+ 100 percentage) 100))))

(define (percent interval)
  (let ((center-value (center interval))
        (width (- (upper-bound interval) (lower-bound interval))))
    (/ (* 50 width) center-value)))

(define (center interval)
  (/ (+ (lower-bound interval)
        (upper-bound interval))
     2))


(define interval (make-center-percent 1 10))
(display (percent interval))
(newline)
(display (center interval))