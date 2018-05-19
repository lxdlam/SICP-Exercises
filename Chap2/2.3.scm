(load "2.2.scm")

;; Two side
;; Will only include one implement
(define (length-point pa pb)
  (sqrt (+ (square (- (x-point pa) (x-point pb)))
	   (square (- (y-point pa) (y-point pb))))))

(define (length-segment seg)
  (length-point (start-segment seg) (end-segment seg)))

(define (make-rect upside leftside)
  (cons upside leftside))

(define (up-side rect) (car rect))

(define (left-side rect) (cdr rect))

(define (area rect)
  (* (length-segment (up-side rect))
     (length-segment (left-side rect))))

(define (perimeter rect)
  (* (+ (length-segment (up-side rect))
	(length-segment (left-side rect)))
     2))
