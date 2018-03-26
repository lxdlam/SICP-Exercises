;; test util
(define (test k)
  (count-frac (lambda (i) 1.0) (lambda (i) 1.0) k))
;; k = 11

;; Recursive form
;;(define (count-frac n d k)
;;  (define (helper count)
;;    (if (= count k)
;;        (/ (n count) (d count))
;;        (/ (n count) (+ (d count) (helper (+ count 1))))))
;;  (helper 1))

;; Iterate form
(define (count-frac n d k)
  (define (iter result count)
    (if (= count 0)
        result
        (iter (/ (n count) (+ (d count) result)) (- count 1))))
  (iter 0 k))
