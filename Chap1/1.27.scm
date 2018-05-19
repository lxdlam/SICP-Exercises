(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
     (remainder (square (expmod base (/ exp 2) m)) m))
    (else 
      (remainder (* base (expmod base (- exp 1) m)) m))))

(define (check n)
  (mod-check (- n 1) n))

(define (mod-check a n)
  (cond ((= a 1) true)
    ((= (expmod a n n) a) (mod-check (- a 1) n))
    (else false)))

;; Result
;; Carmichael Number
;; 561 1105 1729 2465 2821 6601
;; #t   #t   #t   #t   #t   #t
;; Prime numer
;; 2  3  5  7
;; #t #t #t #t
;; Non-prime number
;; 4  9  16 24
;; #f #f #f #f
