(define (reverse list_)
  (if (null? (cdr list_))
      list_
      (append (reverse (cdr list_)) (list (car list_)))))

(let ((list1 (list 1))
      (list2 (list 1 2 3 4)))
  (begin
    (display (reverse list1))
    (newline)
    (display (reverse list2))
    (newline)))