(define (tree-map function tree)
  (cond ((null? tree) '())
        ((pair? tree)
         (cons (tree-map function (car tree))
               (tree-map function (cdr tree))))
        (else (function tree))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (define (fetch-firsts seqs)
    (if (null? seqs)
        '()
        (cons (caar seqs) (fetch-firsts (cdr seqs)))))
  (define (fetch-rests seqs)
    (if (null? seqs)
        '()
        (cons (cdar seqs) (fetch-rests (cdr seqs)))))
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (fetch-firsts seqs))
            (accumulate-n op init (fetch-rests seqs)))))