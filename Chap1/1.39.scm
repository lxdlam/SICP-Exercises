(define (count-frac n d k)
  (define (iter result count)
    (if (= count 0)
        result
        (iter (/ (n count) (+ (d count) result)) (- count 1))))
  (iter 0 k))

(define (tan-cf x k)
  (count-frac (lambda (i) (if (= i 1)
                              x
                              (- (square x))))
              (lambda (i) (+ (* 2 i) -1))
              k))

;; (tan-cf 1.56 10)
;; => 92.62049631669451
