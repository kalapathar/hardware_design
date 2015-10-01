;;; print square roots in Scheme language.  R. Brown, 9/2010



(define sum-squares
	(lambda(n)
		(if (< n 1) 0
		(+ (* n n) (sum-squares(- n 1))))))

		



(define print-sqrts
  (lambda (n) 
  	(if (>  n 5) 'done
	(begin 
	  (display n)
	  (display "\t")
	  (display (sum-squares n))
	  (newline)
	  (print-sqrts (+ n 1))))))


(display "(n\tn!)")
(newline)
(display "------------------")
(newline)
(print-sqrts 0)



