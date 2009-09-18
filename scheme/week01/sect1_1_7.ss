; This is the code from section 1.1.7 of SICP
;  I had to change the name of the functin to sqrt since DR Scheme is complaining about redefining the constant sqrt
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (sqrt2 x)
  (sqrt-iter 1.0 x))

(sqrt2 9)
; produces 3.00009155413138 - error in 5th decimal place

(sqrt2 (+ 100 37))
; produces 11.704699917758145

(sqrt2 (+ (sqrt 2) (sqrt 3)))
; produces 1.7739013287063172

(square (sqrt2 1000))
; produces 1000.000369924366 - same result

(sqrt2 0.001)
; produces 0.04124542607499115
(square (sqrt2 0.001))
; produces 0.0017011851721075596

(sqrt2 10000000000)
; produces 100000.0

(square (sqrt2 10000000000))
;produces 10000000000.0