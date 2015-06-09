; Exercise 1.34: Suppose we define the procedure
(define (f g) (g 2))

; Then we have
(define (square n) (* n n))
(f square)
; 4

(f (lambda (z) (* z (+ z 1))))
; 6

; What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.

; (f f) evalutates to (f 2).
; That, in turn, evaluates to (2 2). This throws an error, since 2 is not a procedure.
