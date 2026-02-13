(load "../lib/collection.scm")

; element-of-set? remains the same cuz the original version checks all elements
; in the set to find the target element as well.

; adjoin-set becomes prepending the element to the beginning of the set directly
; cuz the output set can hold duplicate elements
(define (adjon-set x set)
  (cons x set)
)

; union-set becomes concatnating 2 sets directly cuz the output set can hold duplicate
; elements
(define (union-set set1 set2)
  (if (null? set1)
      set2
      (cons (car set1) (union-set (cdr set1) set2))
  )
)

; intersection-set remains the same cuz it depends on element-of-set?