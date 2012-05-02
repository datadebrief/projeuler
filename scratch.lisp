(defun range-iter (a b c)
	(cond ((> a b) c)
		((<= a b) (range-iter (+ 1 a) b (cons a c)))))

(defun range2 (start stop)
	(nreverse (range-iter start stop '())))

(defun range (end &optional (start 1)) 
	(loop for i from start to end collecting i))

(defun factors2 (n)
	(let ((x '()))
		(dotimes (i (1+ n)) (when (> i 0) (if (= 0 (mod n i)) (push i x))))
		x))

(defun abundant-number? (n)
	(> (- (reduce '+ (factors2 n)) n) n))

(defun abundant-list ()
"Find the sum of all the positive integers 
which cannot be written as the sum of two abundant numbers.
stop when greater than 28123
1, list abundant ints up to 28...
1.1 list permutations/combinations of such
2, remove them from list up to 28...
3. reduce '+
"

)

(print (mapcar 'abundant-number? (range 30)))
; (print (factors2 30))






































; (defvar mylist (remove-if (lambda (x) (search "9" (prin1-to-string x))) (range 1 1200)))
; (print mylist)
; (print
; 	(reduce '+  (mapcar (lambda (x) (* 1.000000000000 (/ 1 x))) mylist)))
; (print nil)
; (defvar e368list (mapcar (lambda (x) (* 1.000000000000 (/ 1 x))) (range 1 100)))
; (print 
; 	(reduce '+ (remove-if (lambda (x) (search "9" (prin1-to-string x))) e368list)))

; (print 
; 	(remove-if (lambda (x) (search "9" (prin1-to-string x))) e368list))

; (print (lambda (x) (search "9" (prin1-to-string x))) e368list))







; (defun split-num (num) 
; 	(mapcar 'parse-integer 
; 	  (loop for char across (prin1-to-string num) collect (string char))))


; (print (reduce '+ (split-num (expt 99 99))))
