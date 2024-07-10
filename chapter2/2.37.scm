; import lib/collection.scm
(define matrix (list (list 1 2) (list 3 4)))
(define vector (list 5 6))

(define (vector-*-vector v1 v2)
  (accumulate + 0 (map * v1 v2)))

(define (dot-product v w)
  (accumulate + 0 (map vector-*-vector v w)))
(display (dot-product matrix matrix))
(newline)

(define (matrix-*-vector m v)
  (map (lambda (x) (vector-*-vector x v)) m))
(display (matrix-*-vector matrix vector))
(newline)

(define (transpose mat)
  (accumulate-n cons '() mat))
(display (transpose matrix))
(newline)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))
(display (matrix-*-matrix matrix matrix))
(newline)