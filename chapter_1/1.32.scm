; 1. Show that sum and product (Exercise 1.31) are both special cases of a still
; more general notion called accumulate that combines a collection of terms,
; using some general accumulation function:
; (accumulate
;  combiner null-value term a next b)
; Accumulate takes as arguments the same term and range specifications as sum
; and product, together with a combiner procedure (of two arguments) that
; specifies how the current term is to be combined with the accumulation of the
; preceding terms and a null-value that specifies what base value to use when
; the terms run out. Write accumulate and show how sum and product can both be
; defined as simple calls to accumulate.

; Functions for testing term and next arguments
(define (identity n) n)
(define (inc n)
  (+ n 1))

; Old sum and product functions
(define (old-sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (old-sum term (next a) next b))))

(define (old-product term a next b)
  (if (> a b)
    1
    (* (term a)
       (old-product term (next a) next b))))

; accumulate function
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))


; 2. If your accumulate procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.
(define (accumulate-iteratively combiner null-value term a next b)
  (define (iterate number result)
    (if (> number b)
      result
      (iterate (next number)
               (combiner (term number) result))))
  (iterate a null-value))
