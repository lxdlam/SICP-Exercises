;; smallest-divisor from the book
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

;; next
(define (next a)
  (if (= a 2)
      3
      (+ a 2)))
