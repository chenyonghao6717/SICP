(define (approximate-tolerance interval1 interval2)
  (let ((tolerance1 (percent interval1))
        (tolerance2 (percent interval2)))
    ((+ tolerance1 tolerance2))))