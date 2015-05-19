; Exercise 1.8.  Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value

(/ (+ (/ x (square y)) (* 2 y)) 3)
; Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In section 1.3.4 we will see how to implement Newton's method in general as an abstraction of these square-root and cube-root procedures.)

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (improve guess x)
  (/
   (+ (/ x (square guess)) (* 2 guess))
   3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (cube-root-iterator guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iterator (improve guess x)
                          x)))

(define (cube-root x)
  (cube-root-iterator 1.0 x))

(cube-root 27)
; 3.0000005410641766
(cube-root 1000)
; 10.000000145265767
