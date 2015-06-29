; Exercise 1.41: Define a procedure double that takes a procedure of one argument
; as argument and returns a procedure that applies the original procedure twice.
; For example, if inc is a procedure that adds 1 to its argument, then (double inc)
; should be a procedure that adds 2.
(define (double f)
  (lambda (x) (f (f x))))

; What Value is returned by
(((double (double double)) inc) 5)

(define z (lambda (x) (double (double x))))
(((double z) inc) 5)
((z (z inc)) 5)
((z (double (double inc))) 5)
((double (double (double (double inc)))) 5)
; 21
