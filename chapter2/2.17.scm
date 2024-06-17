(define (last-pair list_)
  ; the given list is always a non-empty list
  (if (null? (cdr list_))
      (car list_)
      (last-pair (cdr list_))))

(let ((list_ (list 1 2 3 4)))
  (begin
    (display (last-pair list_))
    (newline)))