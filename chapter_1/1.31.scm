; The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures. Write an analogous procedure called product that returns the product of the values of a function at points over a given range. Show how to define factorial in terms of product. Also use product to compute approximations to π using the formula.
; π/4 = (2⋅4⋅4⋅6⋅6⋅8⋅⋯ ) / (3⋅3⋅5⋅5⋅7⋅7⋅⋯ ).
; If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; Write an analogous procedure called product that returns the product of the values of a function at points over a given range.
(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

; Show how to define factorial in terms of product.
(define (inc x)
  (+ 1 x))

(define (factorial n)
  (define (identity x) x)
  (product identity 1 inc n))

; Also use product to compute approximations to π using the formula.
; π/4 = (2⋅4⋅4⋅6⋅6⋅8⋅⋯ ) / (3⋅3⋅5⋅5⋅7⋅7⋅⋯ ).
; = (2n * (2n + 2)) / (2n+1)^2

(define (square x)
  (* x x))

(define (pi-product iteration-count)
  (define (next n)
    (+ n 2))
  (define (nth-pi-term n)
    (/ (* n (+ n 2))
       (square (+ n 1))))
  (product nth-pi-term 2 next (* 2 iteration-count)))

; If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.
