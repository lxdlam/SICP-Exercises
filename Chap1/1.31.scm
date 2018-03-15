;; Recursive
;;(define (product term a next b)
;;  (if (> a b)
;;      1
;;      (* (term a) (product term (next a) next b))))

;; Iterate
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

;; factorial
(define (factorial n) (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

;; pi/4
(define (get-pi n)
  (* (exact->inexact (/
    (product (lambda (x) (if (odd? x) (+ 1 x) (+ 2 x))) 1 (lambda (x) (+ x 1)) n)
    (product (lambda (x) (if (odd? x) (+ 2 x) (+ 1 x))) 1 (lambda (x) (+ x 1)) n))) 
  4))