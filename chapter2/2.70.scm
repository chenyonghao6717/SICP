(load "2.68.scm")
(load "2.69.scm")

(define (symbol-downcase sym)
  (string->symbol (string-downcase (symbol->string sym))))

(define (pairs-downcase pairs)
  (map (lambda (pair) (cons (symbol-downcase (car pair)) (cdr pair))) pairs))

(define (symbols-downcase symbols)
  (map symbol-downcase symbols))

(define tree
  (let ((pairs '((NA 16) (YIP 9) (SHA 3) (A 2) (GET 2) (JOB 2) (BOOM 1) (WAH 1))))
    (generate-huffman-tree
      (pairs-downcase pairs))))

(display "==========================\n")
(display "2.70\n")
(display (encode (symbols-downcase '(Get a job)) tree))
(newline)
(display (encode (symbols-downcase '(Sha na na na na na na na na)) tree))