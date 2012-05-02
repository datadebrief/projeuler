

(defun split-num (num) 
	(mapcar 'parse-integer 
	  (loop for char across (prin1-to-string num) collect (string char))))


(print (reduce '+ (split-num (expt 99 99))))

(defparameter *euler56* '())
(dotimes (i 100) 
	(dotimes (j 100) 
		(push (reduce '+ (split-num (expt i j))) *euler56*)))

(car (sort *euler56* '>))
; 972