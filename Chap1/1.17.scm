(define (mul a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mul a (halve b))))
        (else (+ a (mul a (- b 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (double a)
  (* 2 a))

(define (halve a)
  (/ a 2))