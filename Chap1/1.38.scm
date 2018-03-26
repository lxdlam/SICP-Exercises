(define (count-frac n d k)
  (define (iter result count)
    (if (= count 0)
        result
        (iter (/ (n count) (+ (d count) result)) (- count 1))))
  (iter 0 k))

(define (d x)
  (let ((k (+ x 1)))
    (if (= 0 (remainder k 3))
        (* 2 (/ k 3))
        1)))

(define (e k)
  (+ (count-frac (lambda (x) 1.0) d k) 2))

;; (e 25)
;; => 2.7182818284590455
