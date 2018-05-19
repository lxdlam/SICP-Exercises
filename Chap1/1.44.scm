;; Ex 1.43
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f times)
  (define (iter fc count)
    (if (= count times)
	(lambda (x) (fc x))
	(iter (compose f fc) (+ count 1))))
  (iter f 1))

;; Smooth
(define (smooth f)
  (lambda (x) (/
		(+
		  (f (- x dx))
		  (f x)
		  (f (+ x dx)))
		3)))

(define dx 0.0001)

(define (n-smooth f n)
  (repeated smooth n) f)

;; ((smooth tan) 1.56)
;; => 92.62579438967937
;; ((n-smooth tan 10) 1.56)
;; => 92.62049631670456
