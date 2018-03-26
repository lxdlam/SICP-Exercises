;; From the book
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
	       (* (numer y) (denom )))
	    (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
	       (* (numer y) (demon x)))
	    (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
	    (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
	    (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;; Modified make-rat
(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d)))
	(an (abs n))
	(ad (abs d)))
    (if (or (and (> n 0) (> d 0)) (and (< n 0) (< d 0)))
	(cons (/ an g) (/ ad g))
	(cons (- (/ an g)) (/ ad g)))))

