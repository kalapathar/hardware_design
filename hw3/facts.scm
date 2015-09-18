;;; print square roots in Scheme language.  R. Brown, 9/2010



(define factorial
	(lambda(n)
		(if (< n 1) 1
			(* n (factorial(- n 1))))))

		



(define print-sqrts
  (lambda (n) ; print square roots from n to 5
    (if (>  n 5) 'done
	(begin 
	  (display n)
	  (display "\t")
	  (display (factorial n))
	  (newline)
	  (print-sqrts (+ n 1))))))


(display "(n\tn!)")
(newline)
(display "------------------")
(newline)
(print-sqrts 0)

