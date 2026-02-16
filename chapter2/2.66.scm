(load "../lib/test-helper.scm")

(define (lookup given-key set-of-records)
  (if (null? set-of-records)
      '()
      (let
        (
          (entry (cadr set-of-records))
          (left (car set-of-records))
          (right (caddr set-of-records))
        )
        (let ((key (car entry)) (value (cadr entry)))
          (cond ((= given-key key) value)
                ((< given-key key) (lookup given-key left))
                (else (lookup given-key right))
          )
        )
        
      )
  )
)

(assert-equal 'a (lookup 5 '((() (5 a) ()) (6 b) (() (7 c) ()))))