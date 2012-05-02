(require racket/math srfi/1)

(define (factorial n) (if (< n 2) 1 (* n (fact (- n 1)))))

; (define (factor_iter x y z)
	; (cond
; 		[(= x y) (cons x z)]
; 		[(= 0 (modulo y x)) (factor_iter (add1 x) y (cons x z) )]
; 		[else (factor_iter (add1 x) y z)]
; 		))

; (define (factors n) 
; 	(factor_iter 1 n '()))
	;;; (factor_iter 1 (ceiling (sqrt n)) '()))

(define (facts z)
	(filter (lambda (x) (= 0 (modulo z x))) (cdr (build-list (add1 z) values))))
	; (filter (lambda (x) (= 0 (modulo z x))) (list-tail (build-list (add1 z) values) 1)))
