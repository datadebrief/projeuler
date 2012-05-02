(fn lend[%] (cond (= '() (rest %)) (first %) :else (lend (rest %))))

(= ((fn lend[%] (cond (= '() (rest %)) (first %) :else (lend (rest %))))
 [1 2 3 4 5]) 5)




(defn seclend[%] (cond (= 1 (count (rest %))) (first %) :else (seclend (rest %))))

(fn seclend[%] (cond (= 1 (count (rest %))) (first %) :else (seclend (rest %))))

(= ((fn seclend[%] (cond (= 1 (count (rest %))) (first %) :else (seclend (rest %)))) (list 1 2 3 4 5)) 4)




(defn nthlend[a n] (cond (= (- n 1) (count (rest a))) (first a) :else (nthlend (rest a) n)))

(fn nthlend[a n] (cond (= (- n 1) (count (rest a))) (first a) :else (nthlend (rest a) n)))

(= ((fn nthlend[a n] (cond (= (- n 1) (count (rest a))) (first a) :else (nthlend (rest a) n))) '(4 5 6 7) 2) 6)

(= ((fn nthlend[a n] (cond (= (- n 1) (count (rest a))) (first a) :else (nthlend (rest a) n))) '([1 2] [3 4] [5 6]) 2) [5 6])

(fn nthlend[a n] (first (drop n a)))


(= ((fn nthlend[a n] (first (drop n a))) '(4 5 6 7) 2) 6)
(= ((fn nthlend[a n] (first (drop n a))) [1 2 3 4] 1) 2)
(= ((fn nthlend[a n] (first (drop n a))) '([1 2] [3 4] [5 6]) 2) [5 6])


(fn len[% n] (cond (= '() n) (first %) :else (len (rest %) (+ 1 n))))

(= (

(defn len 
([x] (len x 1))
([x n] (cond (= '() (rest x)) n :else (len (rest x) (+ 1 n)))))

'(1 2 3 3 1)) 5)


(= ((defn len 
([x] (len x 1))
([x n] (cond (= '() (rest x)) n :else (len (rest x) (+ 1 n)))))
 '(13)) 1)


 (= ((defn len 
([x] (len x 1))
([x n] (cond (= '() (rest x)) n :else (len (rest x) (+ 1 n)))))
 '(:a :b :c)) 3)

 
; def fib n
;  fib_iter(1,0,n)
; end

; def fib_iter a,b,count
;   if (count == 0) then
;    b
;   else 
; 	fib_iter(a+b,a,count-1)
;   end
; end

(fn fib
([n] (fib 1 0 n '()))
([a b i z] (cond (= 0 i) (sort z) :else (fib (+ a b) a (- i 1) (cons a z)))))

(fib 3)
(= (fib 3) '(1 1 2))


(defn ft
([a] (ft a '()))
([a b] (cond (= (rest a) '()) b :else (ft (rest a) (concat (first a) b)) )))

(ft '((1 2) 3 [4 [5 6]]))
(= (ft '((1 2) 3 [4 [5 6]])) '(1 2 3 4 5 6))



(fn [x]
(filter (complement sequential?)
(rest (tree-seq sequential? seq x))))
          )
(= ((fn [x]
(filter (complement sequential?)
(rest (tree-seq sequential? seq x)))) '((1 2) 3 [4 [5 6]])) '(1 2 3 4 5 6))


; (fn mx 
; ([a] (mx (rest (list a)) (first (list a))))
; ([a b] 
; (cond 
; 	(= 2 (count (list a b))) (last (sort (list a b)))
; 	(= '() (rest (list a))) (first (list b))
; 	(> (first (list a)) (first (list b))) (mx (rest (list a)) (first (list a)))
; 	:else (mx (rest (list a)) (first (list b)))))
; ([x y z & more]
; (mx (list y z more) x)))

(fn mx
	[x & more] (last (sort (flatten (list x more)))))

(= (mx 1 8 3 4) 8)

(= (mx 45 67 11) 67)

(= (mx 30 20) 30)

