; import chapter2/2.07.scm

(define (mul-interval x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y)))
    (cond ((> x1 0)
           (cond ((> y1 0) (make-interval (* x1 y1) (* x2 y2)))
                 ((< y2 0) (make-interval (* x2 y1) (* x1 y2)))
                 (else (make-interval (* x2 y1) (* x2 y2)))))
          ((< x2 0)
           (cond ((> y1 0) (make-interval (* x1 y2) (* x2 y1)))
                 ((< y2 0) (make-interval (* x2 y2) (x1 y1)))
                 (else (make-interval (* x1 y2) (* x1 y1)))))
          (else
           (cond ((> y1 0) (make-interval (* x1 y2) (* x2 y2)))
                 ((< y2 0) (make-interval (* x2 y1) (* x1 y1)))
                 (else (make-interval (min (* x1 y2) (x2 y1))
                                      (max (* x1 y1) (x2 y2)))))))))