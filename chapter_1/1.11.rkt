#lang R5RS
(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))

(define (g n)
  (define (g-iterator x y z count)
    (if (= count 0)
        z
        (g-iterator (+ x (* 2 y) (* 3 z)) x y (- count 1))))
  (g-iterator 2 1 0 n))