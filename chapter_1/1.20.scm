; Exercise 1.20.  The process that a procedure generates is of course dependent on the rules used by the interpreter. As an example, consider the iterative gcd procedure given above. Suppose we were to interpret this procedure using normal-order evaluation, as discussed in section 1.1.5. (The normal-order-evaluation rule for if is described in exercise 1.5.) Using the substitution method (for normal order), illustrate the process generated in evaluating (gcd 206 40) and indicate the remainder operations that are actually performed. How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation?


(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Normal order: fully expand, then reduce
(gcd 206 40)
(gcd 40 (remainder 206 40)) ; evaluate (remainder 206 40) to see if it's equal to 0 ; thanks to http://www.billthelizard.com/2010/01/sicp-exercise-120-gcd.html
(= (remainder 206 40) 0) ; remainder evaluated 1 time; (remainder 206 40) != 0, so move on.
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(= (remainder 40 (remainder 206 40)) 0) ; remainder evaluated 2 times
(= 4 0)
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(= (remainder (remainder 206 40)
              (remainder 40 (remainder 206 40)))
   0) ; remainder evaluated 4 times
(= 2 0)
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(= (remainder (remainder 40 (remainder 206 40))
              (remainder (remainder 206 40)
                         (remainder 40 (remainder 206 40))))
   0) ;
(= 4 2)
(gcd (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
     (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                (remainder (remainder 40 (remainder 206 40))
                           (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
(= (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
              (remainder (remainder 40 (remainder 206 40))
                         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
   0)
(= (remainder 2 2) 0) ; remainder evaluated 11 times
(= 0 0) ; remainder evaluated 1 time
(remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
 2 ; remainder evaluated 7 times
; remainder evaluated 26 times in total; Bill the Lizard says 18 times. Check to see where I went wrong.

; Applicative order: evaluate, then apply
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6) ; 1st remainder evaluation
(gcd 6 (remainder 40 6))
(gcd 6 4) ; 2nd remainder evaluation
(gcd 4 (remainder 6 4))
(gcd 4 2) ; 3rd remainder evaluation
(gcd 2 (remainder 4 2))
(gcd 2 0) ; 4th remainder evaluation
2

; remainder is evaluated 4 times.
