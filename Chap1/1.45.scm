;; From Ex 1.36
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

;; From Ex 1.43
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f times)
  (define (iter fc count)
    (if (= count times)
        (lambda (x) (fc x))
        (iter (compose f fc) (+ count 1))))
  (iter f 1))

;; From the book
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; Average damp time
;; log(2, n) -> (log2 n)
;; From http://sicp.readthedocs.io/en/latest/chp1/45.html
(define (log2 n)
    (cond ((> (/ n 2) 1)
            (+ 1 (log2 (/ n 2))))
          ((< (/ n 2) 1)
            0)
          (else
            1)))

;; roots
;; x=y^n
(define (roots x n)
  (fixed-point ((repeated average-damp (log2 n)) (lambda (y) (/ x (fast-expt y (- n 1))))) 1.0))
;; 7^15 = 4747561509943
;; (roots 4747561509943 15)
;; => 7.00000459175445
