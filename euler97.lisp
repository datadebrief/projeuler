; (princ (+ 2 2 2))

(defparameter megapow (expt 2 7830457))
(defparameter bigstr  (prin1-to-string (+ 1 (* 28433 megapow))))
(princ (subseq bigstr (- (length bigstr) 10) (length bigstr)))

