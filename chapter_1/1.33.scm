; You can obtain an even more general version of accumulate (Exercise 1.32) by
; introducing the notion of a filter on the terms to be combined. That is,
; combine only those terms derived from values in the range that satisfy a
; specified condition. The resulting filtered-accumulate abstraction takes the
; same arguments as accumulate, together with an additional predicate of one
; argument that specifies the filter. Write filtered-accumulate as a procedure.

(define (filtered-accumulate combiner null-value term a next b predicate)
  (cond ((> a b) null-value)
        ((predicate a) (combiner (term a)
                                 (filtered-accumulate combiner null-value term (next a) next b predicate)))
        (else (filtered-accumulate combiner null-value term (next a) next b predicate))))

; Show how to express the following using filtered-accumulate:
; 1. the sum of the squares of the prime numbers in the interval a to b
; (assuming that you have a prime? predicate already written)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n)
  (* n n))

(define (inc n)
  (+ n 1))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

; 2. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i<n such that GCD(i,n)=1).

(define (identity n) n)

(define (dec n)
  (- n 1))

(define (relatively-prime? a b)
  (= 1 (gcd a b)))

(define (product-relatively-prime-to n)
  (define (relatively-prime-to-n? a)
    (relatively-prime? a n))
  (filtered-accumulate * 1 identity 2 inc (dec n) relatively-prime-to-n?))
