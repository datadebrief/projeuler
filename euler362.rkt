#lang racket
(require srfi/1)
(define (sqfree n)
  (not (equal? (sqrt n) (floor (sqrt n)))))

(define (factors n)
  (define (*factors d)
    (cond ((> d n) (list))
          ((= (modulo n d) 0) (cons d (*factors (+ d 1))))
          (else (*factors (+ d 1)))))
  (*factors 1))
 

(newline)
(map factors (factors 54))