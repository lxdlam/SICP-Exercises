(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((nontrivial-square-root? base m) 0) ;; add, just check a single number
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m)) m))
        (else 
          (remainder (* base (expmod base (- exp 1) m)) m))))

(define (nontrivial-square-root? a n)
  (and
    (not (= a 1))
    (not (= a ( - n 1)))
    (= 1 (remainder (square a) n))
  ))

(define (Miller-Rabin-test n)
  (test-iter n (ceiling (/ n 2)))) ;; check n/2 times

(define (test-iter n times)
  (cond ((= times 0) true)
        ((= (expmod 
              (+ 1 (random (- n 2))) 
              (- n 1) 
              n) 
         1) 
          (test-iter n (- times 1)))
        (else false)))

;; Result
;; Carmichael Number
;; 561 1105 1729 2465 2821 6601
;; #f   #f   #f   #f   #f   #f
;; Prime numer
;; 2  3  5  7
;; #t #t #t #t
;; Non-prime number
;; 4  9  16 24
;; #f #f #f #f