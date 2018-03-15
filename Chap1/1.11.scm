;; Recursive version
(define (fr n)
  (if (< n 3)
      n
      (+ 
      (fr (- n 1))
      (* 2 (fr (- n 2)))
      (* 3 (fr (- n 3))))))

;; Iterate version
(define (fi n)
  (fi-iter 2 1 0 n))

(define (fi-iter a b c count)
  (if (= 0 count)
      c
      (fi-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))