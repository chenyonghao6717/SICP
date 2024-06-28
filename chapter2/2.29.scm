(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

; b
(define (total-weight-branch branch)
    (let ((structure (branch-structure branch)))
      (if (pair? structure)
          (total-weight structure)
          structure)))

(define (total-weight mobile)
  (+ (total-weight-branch (left-branch mobile))
     (total-weight-branch (right-branch mobile))))

; c
(define (balanced mobile)
  (define (torque branch)
    (* (branch-length branch)
       (total-weight-branch branch)))
  (= (torque (left-branch mobile))
     (torque (right-branch mobile))))

; just change 'cadr' in right-branch and branch-structure to 'cdr'

; test
(define mobile1
  (make-mobile
    (make-branch 1 1)
    (make-branch 2 2)))

(define mobile2
  (make-mobile
    (make-branch 1 1)
    (make-branch 2 mobile1)))

(define mobile3
  (make-mobile
    (make-branch 2 1)
    (make-branch 1 2)))

(display (total-weight mobile1))
(newline)
(display (total-weight mobile2))
(newline)
(display (balanced mobile1))
(newline)
(display (balanced mobile2))
(newline)
(display (balanced mobile3))