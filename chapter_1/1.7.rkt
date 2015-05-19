#lang scheme
(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-good-enough? new-guess old-guess)
  (< (abs (/ (- new-guess old-guess) new-guess)) 0.001))

(define (new-sqrt-iter new-guess old-guess x)
  (if (new-good-enough? new-guess old-guess)
      new-guess
      (new-sqrt-iter (improve new-guess x)
                     new-guess
                     x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 0.5 x))