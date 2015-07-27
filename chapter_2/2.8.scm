;; Exercise 2.8: Using reasoning analogous to Alyssa’s, describe how the
;; difference of two intervals may be computed. Define a corresponding
;; subtraction procedure, called sub-interval.

(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (sub-interval x y)
  (make-interval (- (lower-bound x)
		    (lower-bound y))
		 (- (upper-bound x)
		    (upper-bound y))))
