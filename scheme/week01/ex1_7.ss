(define (sqrt-iter last guess x)
  (if (good-enough? last guess)
      guess
      (sqrt-iter guess
                 (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? last guess)
  (< (abs (/(- last guess) guess)) 0.001))

(define (square x) (* x x))

(define (sqrt2 x)
  (sqrt-iter 1.0 (improve 1.0 x) x))

(sqrt2 9)
; produces 3.000000001396984 - error in 9th decimal place

(sqrt2 (+ 100 37))
; produces 11.704699917758145

(sqrt2 (+ (sqrt 2) (sqrt 3)))
; produces 1.7737712329573045

(square (sqrt2 1000))
; produces 1000.000369924366 - same result

(sqrt2 0.001)
; produces 0.03162278245070105 vs 0.04124542607499115
(square (sqrt2 0.001))
; produces 0.0010000003699243661 vs  0.0017011851721075596

(sqrt2 10000000000)
; produces 100000.00015603233 vs. 100000.0

(square (sqrt2 10000000000))
;produces 10000000031.206467 vs 10000000000.0

; So this method (comparing the difference in guesses) works better for smaller arguments, but
; comparing the square of the guess with the original argument is better for larger numbers.