(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (symbols node) 
  (cond ((null? node) '())
        ((leaf? node) (list (symbol-leaf node)))
        (else (caddr node))))

(define (weight node) 
  (cond ((null? node) 0)
        ((leaf? node) (weight-leaf node))
        (else (cadddr node))))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((> (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair) ; symbol
                               (cadr pair)) ; frequency
                    (make-leaf-set (cdr pairs))))))
  
(define (successive-merge leaves)
  (let ((len (length leaves)))
    (if (= len 0)
        '()
        (let ((first (car leaves))
              (rest (cdr leaves)))
          (if (null? rest)
              first
              (make-code-tree first (successive-merge rest)))))))
          
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(display "========================")
(newline)
(display "2.69")
(newline)
(display (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))
(newline)