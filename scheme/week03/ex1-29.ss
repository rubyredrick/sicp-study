(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (simpson-integral f a b n)
  (define h 
    (/ (- b a) n))
  (define (y k) 
    (f (+ a (* k h))))
  (define (coeff i)
    (cond 
      ((= 0 i) 1)
      ((= n i) 1)
      ((even? i) 2)
      (else 4)))
  (define (simpson-term k)
    (* (coeff k) (y k)))
  (define (next i)
    (+ 1 i))
   (* (/ h 3.0) (sum simpson-term 0 next n)))

(define (cube n)
  (* n n n))