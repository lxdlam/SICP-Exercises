;; Recursive form
;;(define (iterative-improve good-enough? improve)
;;  (lambda (x)
;;    (let ((newguess (improve x)))
;;         (if (good-enough? x newguess)
;;             newguess
;;             ((iterative-improve good-enough? improve) newguess)))))

;; Iterate form
(define (iterative-improve good-enough? improve)
  (define (iter x)
    (let ((newguess (improve x)))
      (if (good-enough? x newguess)
	  newguess
	  (iter newguess))))
  (lambda (x) (iter x)))

;; sqrt
(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  ((iterative-improve
     (lambda (v1 v2) (< (abs (- v1 v2)) 0.00001))
     (lambda (guess) (average guess (/ x guess)))) 1.0)) ;; See page 20

;; fixed-point
(define (fixed-point f first-guess)
  ((iterative-improve (lambda (v1 v2) (< (abs (- v1 v2)) 0.00001)) f) first-guess))
