;; From the book
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (deriv g)
  (lambda (x) (/ (- (g (+ x 0.000001))
                    (g x))
                 0.000001)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

;; Cubic
(define (cubic a b c) (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

;; (newton-method (cubic 6 15 8) 1)
;; => -.7120902492958704
;; From WolframAlpha: -.71209
