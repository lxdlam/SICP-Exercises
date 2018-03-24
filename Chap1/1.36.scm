(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; From book
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

;; (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
;; => 4.555532270803653
;; 34 Steps
;; (fixed-point (average-damp (lambda (x) (/ (log 1000) (log x)))) 2.0)
;; => 4.555537551999825
;; 10 Steps