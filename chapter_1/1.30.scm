; Exercise 1.30: The sum procedure above generates a linear recursion. The procedure can be rewritten so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in the following definition:

; (define (sum term a next b)
;   (define (iter a result)
;     (if ⟨??⟩
;         ⟨??⟩
;         (iter ⟨??⟩ ⟨??⟩)))
;   (iter ⟨??⟩ ⟨??⟩))

; This is the old sum function
(define (original-sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (original-sum term (next a) next b))))

; This is our iterative sum function
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
     result
      (iter (next a) (+ (term a) result))))
  (iter (term a) 0))

; term functions to test out
(define (identity x ) x)
(define (cube y )
  (* y y y))

; next function to use for identity and cube functions
(define (inc x)
  (+ 1 x))
