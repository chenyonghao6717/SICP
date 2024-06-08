; import chapter2/2.7.scm

(define (new-div-interval interval1 interval2)
  (let ((product-of-interval2 (* (lower-bound interval2) (upper-bound interval2))))
    (if (or (< product-of-interval2 0) (= product-of-interval2 0))
        (error "new-div-interval" "interval2" "spans zero"))
        (div-interval interval1 interval2)))

(display (new-div-interval (make-interval 1 2) (make-interval -1 1)))