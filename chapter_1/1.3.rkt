#lang R5RS

(define (sum-of-max-squares x y z)
  (cond ((= (min x y z) x) (sum-of-squares y z))
        ((= (min x y z) y) (sum-of-squares x z))
        (else (sum-of-squares x y))))

(define (min x y z)
  (less (less x y) z))

(define (less x y)
  (if (< x y) x y))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (square x)
  (* x x))