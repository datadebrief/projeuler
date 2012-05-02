(defn factors
  "Return a list of factors of N."
  ([n]
    (factors n 2 ()))
  ([n k acc]
    (if (= 1 n)      
      acc
      (if (= 0 (rem n k))        
        (recur (quot n k) k (cons k acc))
        (recur n (inc k) acc)))))

(defn prime? 
	"factors is 2"
	([n]
	(= 2 (count (factors n)))))

	