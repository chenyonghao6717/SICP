(define (fisrt-denomination coin-values)
  (car coin-values))

(define (except-first-denomination)
  (cdr (coin-values)))

(define no-more? null?)