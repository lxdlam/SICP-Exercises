;; Recursive version
(define (pascal row col)
  (cond ((= col 0) 1)
    ((= col row) 1)
    (else (+ (pascal (- row 1) col)
	     (pascal (- row 1) (- col 1))))))

;; Iterate version
(define (pascal-iter row col)
  (define (factorial n)
    (define (fact-iter product counter max-count)
      (if (> counter max-count)
	  product
	  (fact-iter (* counter product)
		     (+ counter 1)
		     max-count)))
    (fact-iter 1 1 n))
  (/ (factorial row)
     (* (factorial col)
	(factorial (- row col)))))
