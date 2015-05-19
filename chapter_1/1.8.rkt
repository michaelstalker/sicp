#lang scheme
(define (square x) (* x x))

(define (cube x) (* x x x))

(define (improve guess x)
  (/
   (+ (/ x (square guess)) (* 2 guess))
   3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (cube-root-iterator guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iterator (improve guess x)
                          x)))

(define (cube-root x)
  (cube-root-iterator 1.0 x))