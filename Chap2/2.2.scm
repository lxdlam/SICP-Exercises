;; Point
(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (add pa pb)
  (make-point (+ (x-point pa) (x-point pb))
	      (+ (y-point pa) (y-point pb))))

(define (div p n)
  (make-point (/ (x-point p) n)
	      (/ (y-point p) n)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; Segment
(define (make-segment st en) (cons st en))

(define (start-segment seg) (car seg))

(define (end-segment seg) (cdr seg))

(define (midpoint-segment seg)
  (div
    (add (start-segment seg)
	 (end-segment seg))
    2))
