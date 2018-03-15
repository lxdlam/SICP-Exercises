;; Recursive
;;(define (filtered-accumulate combiner filter null-value term a next b)
;;    (if (> a b)
;;      null-value
;;      (combiner (if (filter a) (term a) null-value)
;;                (filtered-accumulate combiner filter null-value term (next a) next b))))

;; Iterate
(define (filtered-accumulate combiner filter null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (if (filter a) (term a) null-value)))))
  (iter a null-value))

;; sum of primes
(define (sum-primes a b) (filtered-accumulate + prime? 0 (lambda (x) x) a (lambda (x) (+ x 1)) b))

;; From the book at 1.2.6
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; product of coprimes
(define (pro-coprimes n) (filtered-accumulate * (lambda (x) (= (gcd x n) 1)) 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) (- n 1)))

;; From the book at 1.2.5
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))