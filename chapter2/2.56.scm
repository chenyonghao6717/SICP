(load "../lib/math.scm")

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**))
)

(define (base exp) (cadr exp))
(define (exponent exp) (caddr exp))

(define (make-exponentiation base exponent)
  (cond
    ((eq? base 1) 1)
    ((eq? exponent 0) 1)
    ((eq? exponent 1) base)
    ((and (number? base) (number? exponent)) (expt base exponent))
    (else (list '** base exponent))
  )
)

(define (deriv-expt exp var)
  (make-product
    (make-product
      (exponent exp)
      (make-exponentiation (base exp) (- (exponent exp) 1))
    )
    (deriv (base exp) var)
  )
)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum
           (deriv (addend exp) var)
           (deriv (augend exp) var)
         )
        )
        ((product? exp)
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
        ((exponentiation? exp)
          (deriv-expt exp var)
        )
        (else (error "unknow expression type: DERIV" exp))
  )
)