; Exercise 1.11.  A function f is defined by the rule that 
;   f(n) = n if n<3
;     and 
;   f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.
; Write a procedure that computes f by means of a recursive process.
;
; This defintion seems to leave a "hole" if n = 3, so I altered it slightly, not
; sure is this is right

(define (f-rec n)
  (cond ((< n 3) n)
        (else (+
              (f-rec (- n 1))
               (* 2 (f-rec (- n 2)))
               (* 3 (f-rec (- n 3)))))))
; Write a procedure that computes f by means of an iterative process.;

(define (f-it n)
  (define (iteration n count f1 f2 f3)
    (if (> count n)
        f1
        (iteration n
                   (+ 1 count)
                   (+ f1 (* 2 f2) (* 3 f3))
                   f1
                   f2)))
  (if (< n 3)
      n
      (iteration n 3 2 1 0)))