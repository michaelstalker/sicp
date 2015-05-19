#lang racket
; Exercise 2.5.  Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the
; pair a and b as the integer that is the product 2^a * 3^b. Give the corresponding definitions of the procedures cons, car, and cdr.
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car m)
  
(define (find-2s))
         
; make recursive functions that determine how many times you can divide the
; cons return value by two and three.