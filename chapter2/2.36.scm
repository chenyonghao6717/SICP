; import lib/collection.scm

; moved to collection.scm
;(define (accumulate-n op init seqs)
;  (define (fetch-firsts seqs)
;    (if (null? seqs)
;        '()
;        (cons (caar seqs) (fetch-firsts (cdr seqs)))))
;  (define (fetch-rests seqs)
;    (if (null? seqs)
;        '()
;        (cons (cdar seqs) (fetch-rests (cdr seqs)))))
;  (if (null? (car seqs))
;      '()
;      (cons (accumulate op init (fetch-firsts seqs))
;            (accumulate-n op init (fetch-rests seqs)))))

(display (accumulate-n + 0 (list (list 1 2 3) (list 4 5 6))))
(newline)