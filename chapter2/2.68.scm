(load "../lib/test-helper.scm")

(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
  
(define (contains element set)
  (cond ((null? set) #f)
        ((equal? element (car set)))
        (else (contains element (cdr set)))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree
                    (make-leaf 'D 1)
                    (make-leaf 'C 1)))))

(define (encode-symbol symbol tree)
  (define (encode symbol branch bits)
    (if (leaf? branch)
        (if (equal? symbol (symbol-leaf branch))
            bits
            (error "symbol not found" (format #f "~a is not found in the tree" symbol)))
        (let ((left (left-branch branch))
              (right (right-branch branch)))
          (let ((left-symbols (symbols left))
                (right-symbols (symbols right)))
            (if (contains symbol left-symbols)
                (encode symbol left (append bits '(0)))
                (encode symbol right (append bits '(1))))))))
  (encode symbol tree '()))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(display "=========================")
(newline)
(display "2.68")
(newline)
(assert-equal
  '(0 1 0 1 1 1 1 1 0)
  (encode '(A B C D) sample-tree))
