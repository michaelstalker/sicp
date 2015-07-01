;; Exercise 1.45: We saw in 1.3.3 that attempting to compute square
;; roots by naively finding a fixed point of y↦x/y does not converge,
;; and that this can be fixed by average damping. The same method
;; works for finding cube roots as fixed points of the average-damped
;; y ↦ x/y^2. Unfortunately, the process does not work for fourth
;; roots—a single average damp is not enough to make a fixed-point
;; search for y↦x/y^3 converge. On the other hand, if we average damp
;; twice (i.e., use the average damp of the average damp of y ↦ x/y^3)
;; the fixed-point search does converge. Do some experiments to
;; determine how many average damps are required to compute nth roots
;; as a fixed-point search based upon repeated average damping of
;; y ↦ x/y^n−1. Use this to implement a simple procedure for computing
;; nth roots using fixed-point, average-damp, and the repeated
;; procedure of Exercise 1.43. Assume that any arithmetic operations
;; you need are available as primitives.

(define (dec x) (- x 1))

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated func count)
  (if (= count 1)
      func
      (compose func (repeated func (dec count)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y)
     2))

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

(define (square-root x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
	       1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (expt y 2))))
	       1.0))

(define (nth-root x root)
  (fixed-point ((repeated average-damp 3) (lambda (y) (/ x (expt y (dec root)))))
	       1.0))

;; Damping 1 time works for n = (2..3), or up until 2^2
;; Damping 2 times works for n = (4..7), or up until 2^3
;; Damping 3 times works for n = (8..15), or up until 2^4
;; -> Damp floor of log base 2 of n
;; Thanks to http://www.billthelizard.com/2010/08/sicp-145-computing-nth-roots.html
;; for the suggestions about using logs, and for an exact power formula to use.

(define (log-base-n n base)
  (/ (log n) (log base)))

(define (nth-root x root)
  (let ((repeat-count (floor (log-base-n root 2))))
    (fixed-point ((repeated average-damp repeat-count) (lambda (y) (/ x (expt y (dec root)))))
		 1.0)))

