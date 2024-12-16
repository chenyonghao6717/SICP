; import chapter2/2.07.scm

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one
      (add-interval (div-interval one r1)
                    (div-interval one r2)))))

(let ((interval1 (make-interval 1 2))
      (interval2 (make-interval 3 4)))
  (begin
    (display (par1 interval1 interval2))
    (display (par2 interval1 interval2))))
(newline)

; because divide an interval by itself should generate "one" defined in line 8 but the current implement doesn't