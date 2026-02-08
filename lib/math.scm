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

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2))
)

(define (=number? exp num) (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))
  )
)

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))
  )
)

(define (sum? x) (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (product? x) (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (
          (sum? exp)
          (make-sum
            (deriv (addend exp) var)
            (deriv (augend exp) var)
          )
        )
        (
          (product? exp)
          (make-sum
            (make-product
              (multiplier exp)
              (deriv (multiplicand exp) var)
            )
            (make-product
              (multiplicand exp)
              (deriv (multiplier exp) var)
            )
          )
        )
        (else (error "unknow expression type: DERIV" exp))
  )
)