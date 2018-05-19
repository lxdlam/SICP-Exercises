;; Ex 1.42
(define (compose f g)
  (lambda (x) (f (g x))))

;; repeated
;; Recursive form
;;(define (repeated f times)
;;  (if (= times 1)
;;      (lambda (x) (f x))
;;      (compose f (repeated f (- times 1)))))

;; Iterate form
(define (repeated f times)
  (define (iter fc count)
    (if (= count times)
	(lambda (x) (fc x))
	(iter (compose f fc) (+ count 1))))
  (iter f 1))

;; ((repeated square 2) 5)
;; => 625
