; Exercise 1.29: Simpson’s Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson’s Rule, the integral of a function f between a and b is approximated as
; h/3* (y[0] + 4y[1] + 2y[2] + 4y[3] + 2y[4] + ⋯ + 2y[n−2] + 4y[n−1] + y[n]),
; where h=(b−a)/n, for some even integer n, and y[k]=f(a+k*h). (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson’s Rule. Use your procedure to integrate cube between 0 and 1 (with n=100 and n=1000), and compare the results to those of the integral procedure shown above.

(define (cube n)
  (* n n n))

(define (sum-cubes a b)
  (define (inc n) (+ n 1))
  (sum cube a inc b))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (coefficient k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((even? k) 2)
          ((odd? k) 4)))
  (define (kth-y k)
    (f (+ a (* k h))))
  (define (term k)
    (* (coefficient k) (kth-y k)))
  (define (next k)
    (+ 1 k))
  (* (/ h 3)
     (sum term 0 next n)))

(simpson-integral cube 0 1 100) ; 1/4
(simpson-integral cube 0 1 1000) ; 1/4

; I got help from http://www.billthelizard.com/2010/04/sicp-exercise-129-integration-using.html
; I had initially tried passing f, a, and b into sum instead of term, 0, and n.
