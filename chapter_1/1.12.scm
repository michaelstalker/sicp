; Exercise 1.12.  The following pattern of numbers is called Pascal's triangle.
;        1
;       1 1
;      1 2 1
;     1 3 3 1
;    1 4 6 4 1
;       ...

; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it.35 Write a procedure that computes elements of Pascal's triangle by means of a recursive process.
; I'm assuming they want us to find a number at a particular row and column, 1-indexed.
(define (pascal row column)
  (cond ((= 1 column) 1)
        ((= row column) 1)
        (else (+
               (pascal (- row 1) (- column 1))
               (pascal (- row 1) column)))))
