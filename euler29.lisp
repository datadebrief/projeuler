(defun range-iter (a b c)
	(cond ((> a b) c)
		((<= a b) (range-iter (+ 1 a) b (cons a c)))))

(defun range (start stop)
	(nreverse (range-iter start stop '())))

; (defun uniq (n &optional lst)
; 	(cond 
; 		((equal (cdr n) nil) lst)
; 		; ((> (car n) (cadr n)) (uniq (cdr n) (push (car n) lst)))
; 		((< (count (car n) lst) 1) (uniq (cdr n) (push (car n) lst)))
; 		(t (uniq (cdr n) lst))))

(defun uniq2 (n)
	(REMOVE-DUPLICATES n))

(defvar *euler29* '())
(defvar alst (range 2 100))
(defvar blst alst)

(dolist (a alst) 
	(dolist (b blst) 
		(push (expt a b) *euler29*)))

(defvar eu29 (uniq2 *euler29*))

; (print eu29)
; (print (sort eu29 '>))
(print (length eu29))
