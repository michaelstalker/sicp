; Exercise 1.35: Show that the golden ratio φ (1.2.2) is a fixed point of the transformation x↦1+1/x

; Let φ = (1 + √5)/2
; 1 + 1/φ = 1 + (1 / ((1 + √5) / 2))
;         = 1 + 2 / (1 + √5)
;         = 1 + (2 * (1 - √5)) / ((1 + √5) * (1 - √5))
;         = 1 + (2 - 2√5) / (1 - 5)
;         = 1 + (2 - 2√5) / -4
;         = 1 + (-1 + √5) / 2
;         = 2/2 + (-1 + √5) / 2
;         = (1 + √5) / 2

; and use this fact to compute φ by means of the fixed-point procedure.

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1)
; This yields 987/610, which is approximately 1.618
