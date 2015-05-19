;Exercise 1.1
;------------

10
; 10

(+ 5 3 4)
; 12

(- 9 1)
; 8

(/ 6 2)
; 3

(+ (* 2 4) (- 4 6))
; 6

(define a 3)
; not defined?

(define b (+ a 1))
; not defined?

(+ a b (* a b))
; (+ 3 4 12)
; 19

(= a b)
; #f

(if (and (> b a) (< b (* a b)))
    b
    a)
; (if (and (> 4 3) (< 4 12))
;   4
;   3)
; 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; 16

(+ 2 (if (> b a) b a))
; 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
; 16


;Exercise 1.2
;------------
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))


;Exercise 1.3
;------------
(define (sum-of-max-squares x y z)
  (cond ((= (min x y z) x) (sum-of-squares y z))
        ((= (min x y z) y) (sum-of-squares x z))
        (else (sum-of-squares x y))))

(define (min x y z)
  (lesser (lesser x y) z))

(define (lesser x y)
  (if (< x y) x y))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (square x)
  (* x x))


;Exercise 1.4
;------------
;You can evaluate a procedure that returns a procedure.

;Exercise 1.5
;------------
;If the interpreter uses normal-order evaluation, the if-clause will never get around to returning y, so y will never be evaluated. Hence, (p) never gets invoked, and we avoid an infinite loop.

;If the interpreter uses applicative-order evaluation, there will be an infinite loop when (p) gets evaluated.

