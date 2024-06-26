(define (for-each operation list_)
  (if (null? list_)
      #t
      (begin (operation (car list_))
             (for-each operation (cdr list_)))))

(for-each
  (lambda (x) (newline) (display x))
  (list 1 2 3 4))