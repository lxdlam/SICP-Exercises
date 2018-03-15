(define (mul a b)
  (define (mul-iter a b r)
    (cond ((= b 0) r)
          ((even? b) (mul-iter (double a) (halve b) r))
          (else (mul-iter a (- b 1) (+ r a)))))
  (mul-iter a b 0))

(define (even? a)
  (= 0 (remainder a 2)))

(define (double a)
  (* 2 a))

(define (halve a)
  (/ a 2))