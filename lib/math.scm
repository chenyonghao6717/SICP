(define (square x) (* x x))

(define (cube x) (* x x x))

(define (power a b)
  (define (iter product b)
    (if (= b 0)
        product
        (iter (* product a) (- b 1))))
  (let ((product (iter 1 (abs b))))
    (if (< b 0)
      (/ 1 product)
      product)))