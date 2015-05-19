#lang R5RS
(define (pascal row column)
  (cond ((= 1 column) 1)
        ((= row column) 1)
        (else (+
               (pascal (- row 1) (- column 1))
               (pascal (- row 1) column)))))