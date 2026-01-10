; import chapter2/2.07.scm

(define (opposite interval)
  (make-interval 
    (- (upper-bound interval)) 
    (- (lower-bound interval))))

(define (sub-interval interval1 interval2)
  (let ((opposite-interval2 (opposite interval2)))
    (add-interval interval1 opposite-interval2)))