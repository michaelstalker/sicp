;; Exercise 1.44: The idea of smoothing a function is an important concept
;; in signal processing. If f is a function and dx is some small number,
;; then the smoothed version of f is the function whose value at a point x
;; is the average of f(x−dx), f(x), and f(x+dx). Write a procedure smooth
;; that takes as input a procedure that computes f and returns a procedure
;; that computes the smoothed f.

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (let ((lower (- x dx))
		    (middle x)
		    (higher (+ x dx)))
		(/ (+ (f lower) (f middle) (f higher))
		   3))))

;; It is sometimes valuable to repeatedly smooth a function (that is,
;; smooth the smoothed function, and so on) to obtain the n-fold smoothed
;; function. Show how to generate the n-fold smoothed function of any
;; given function using smooth and repeated from Exercise 1.43.

(define (dec x) (- x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated func count)
  (if (= count 1)
      func
      (compose func (repeated func (dec count)))))

(define (n-fold-smooth f count)
  (repeated smooth count) f)
