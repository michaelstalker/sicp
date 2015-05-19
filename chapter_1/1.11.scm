; Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

; Recursive process
(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))

; Iterative process
(define (g n)
  (define (g-iterator x y z count)
    (if (= count 0)
        z
        (g-iterator (+ x (* 2 y) (* 3 z)) x y (- count 1))))
  (g-iterator 2 1 0 n))
