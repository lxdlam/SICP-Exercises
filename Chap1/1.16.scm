;; From the book
(define (fast-expt b n)
  (cond ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

;; 1.16
(define (fast-expt-iter b n)
  (define (fast-expt-iter-helper b n a)
    (cond ((= n 0) a)
      ((even? n) (fast-expt-iter-helper (square b) (/ n 2) a))
      (else (fast-expt-iter-helper b (- n 1) (* b a)))))
  (fast-expt-iter-helper b n 1))
