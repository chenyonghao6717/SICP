; import lib/common-math.scm

(define (square-list-1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))
(display (square-list-1 (list 1 2 3)))
(newline)

; say the given list is (1, 2, 3), namely, (1, (2, (3, '()))). answer starts from '()
; before iteration: (iter '(1, (2, (3, nil))) nil)
; 1st iteration: (iter '(2 (3 nil)) (1 nil))
; 2nd iteration: (iter '(3 nil) (4 (1 nil)))
; square-list-1 always adds the next item to the head of the answer list which consists of previous items

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))
(display (square-list-2 (list 1 2 3)))
(newline)

; before iteration: (iter '(1 (2 (3 nil))) nil)
; 1st iteration: (iter '(2 (3 nil)) '(1 nil))
; 2nd iteration: (iter '(3 nil) '((1 nil) 4))
; '((1 nil) 4) is not a valid list

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                      (list(square (car things)))))))
  (iter items '()))
(display (square-list (list 1 2 3)))
(newline)
