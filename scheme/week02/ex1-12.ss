  (define (edge? row col) (or (<= col 1) (>= col row)))
(define (pascal-element row col)
  (cond
         ((edge? row col) 1)
         (else {+
                (pascal-element (- row 1) (- col 1))
                (pascal-element (- row 1) col)})))

(pascal-element 1 1)
(pascal-element 2 1)
(pascal-element 2 2)
(pascal-element 3 1)
(pascal-element 3 2)
(pascal-element 3 3)
(pascal-element 4 1)
(pascal-element 4 2)
(pascal-element 4 3)
(pascal-element 4 4)