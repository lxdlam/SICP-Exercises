;; From the book

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

;; Get the next odd number

(define (next-odd n)
  (if (odd? n)
      (+ n 2)
      (+ n 1)))

;; countinue-primes
;; from http://sicp.readthedocs.io/en/latest/chp1/22.html
(define (continue-primes n count)
  (cond ((= count 0) (display "are primes."))
        ((prime? n) (display n) (newline) (continue-primes (next-odd n) (- count 1)))
        (else (continue-primes (next-odd n) count))))

;; search-for-primes
;; from http://sicp.readthedocs.io/en/latest/chp1/22.html

(define (search-for-primes n)
  (let ((start-time (real-time-clock)))
       (continue-primes n 3)
       (- (real-time-clock) start-time)))
