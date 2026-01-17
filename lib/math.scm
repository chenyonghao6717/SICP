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

(define (sum nums)
  (define (iter-sum sum_ rest_nums)
    (if (null? rest_nums)
        sum_
        (iter-sum (+ sum_ (car rest_nums)) (cdr rest_nums))
    )
  )
  (iter-sum 0 nums)
)