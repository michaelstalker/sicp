; Exercise 1.18.  Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.40

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (faster* a b)
  (define (iterator a b sum)
    (if (= 0 b)
      sum
      (if (even? b)
          (iterator (double a) (halve b) sum)
          (iterator a (- b 1) (+ a sum)))))
  (iterator a b 0))
