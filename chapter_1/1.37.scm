; 1. An infinite continued fraction is an expression of the form
; f = N1 / (D1 + (N2 / D2 + (N3 / D3 + … ))).
; As an example, one can show that the infinite continued fraction expansion with the Ni and the Di all equal to 1 produces 1/φ, where φ is the golden ratio (described in 1.2.2). One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. Such a truncation—a so-called finite continued fraction k-term finite continued fraction—has the form
; N1 / (D1 + (N2 / (⋱ + (Nk / Dk)))).
; Suppose that n and d are procedures of one argument (the term index i) that return the Ni and Di of the terms of the continued fraction. Define a procedure cont-frac such that evaluating (cont-frac n d k) computes the value of the k-term finite continued fraction. Check your procedure by approximating 1/φ using

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   k)

; for successive values of k. How large must you make k in order to get an approximation that is accurate to 4 decimal places?


(define (cont-frac n d k)
  (if (= k 0)
      0
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

; 1/φ = 0.61803398875
; I had to make k equal 12 to get an approximation that is accurate to 4 decimal places.

(define k 12)
(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)
; 0.6180257510729613

; 2. If your cont-frac procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.


