(load "../lib/math.scm")


(define (addend s) (cadr s))
; original: (define (augend s) (caddr s))
; newly implemented
(define (augend s)
  (let
    ((rest (cddr s)))
    (if (= 1 (length rest))
        (car rest)
        (cons '+ rest)
    )
  )
)

(define (multiplier p) (cadr p))
; original: (define (multiplicand p) (caddr p))
(define (multiplicand p)
  (let
    ((rest (cddr p)))
    (if (= 1 (length rest))
        (car rest)
        (cons '* rest)
    )
  )
)

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