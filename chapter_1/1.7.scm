; Exercise 1.7.  The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers.

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(sqrt 0.00001)
; 0.03135649010771716
(square 0.03135649010771716)
; 0.0009832294718753643

; The 0.001 threshold in good-enough? is to large to use in finding the square roots of very small numbers. The difference between the square of our guess and the number we want to find the square root of will be less than 0.001 long before we get a very accurate answer.

; For large numbers...?

; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?
(define (new-good-enough? new-guess old-guess)
  (< (abs (/ (- new-guess old-guess) new-guess)) 0.001))

(define (new-sqrt-iter new-guess old-guess x)
  (if (new-good-enough? new-guess old-guess)
      new-guess
      (new-sqrt-iter (improve new-guess x)
                     new-guess
                     x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 0.5 x))

(new-sqrt 0.00001)
; 0.0031622776602038957
(square 0.0031622776602038957)
; 1.0000000000224625e-05
; The new implementation works better for small numbers than the old implementation.
