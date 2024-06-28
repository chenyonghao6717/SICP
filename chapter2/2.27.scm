(define (reverse-deep list_)
  (if (null? list_) 
      list_
      (append 
        (reverse-deep (cdr list_))
        (list 
          (if (pair? (car list_))
              (reverse-deep (car list_))
              (car list_))))))
(let ((list_ (list (list 1 2) (list 3 4))))
  (display (reverse-deep list_))
  (newline))
