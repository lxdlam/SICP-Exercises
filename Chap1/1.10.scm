(define (A x y)
  (cond ((= y 0) 0)
    ((= x 0) (* 2 y))
    ((= y 1 ) 2)
    (else (A (- x 1)
	     (A x (- y 1))))))

;; Real Ackermann function?
;; From wikipedia
;; https://www.wikiwand.com/en/Ackermann_function
;; Also see Ackermann.py
(define (AA m n)
  (cond (= m 0) (+ n 1)
    (= n 0) (AA (- m 1) 1))
  (else (AA (- m 1) (AA m (- n 1)))))

(A 1 10) ; 1024
(A 2 4)  ; 65536
(A 3 3)  ; 65536

(define (f n) (A 0 n)) ;; f(n) = 2*n
(define (g n) (A 1 n)) ;; g(n) = 2^n
(define (h n) (A 2 n)) ;; h(n) = 2^2^2^......
