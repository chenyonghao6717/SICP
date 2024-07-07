; import lib/math.scm

(define (cons a b)
  (* (power 2 a) (power 3 b)))

(define (selector-iter divider product)
  (define (iter count quotient)
    (if (not (= 0 (remainder quotient divider)))
        count
        (iter (+ count 1) (/ quotient divider))))
  (iter 0 product))

(define (car x) (selector-iter 2 x))
(define (cdr x) (selector-iter 3 x))