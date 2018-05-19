;; From the book
(define zero (lambda (f) (lambda (x) x)))

;; succ
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; For test
(define (inc x) (+ x 1))
(define (eval num) ((num inc) 0))

;; My works
(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add n m)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))
