# require 'Prime'

# Consider the number 54.
# 54 can be factored in 7 distinct ways into one or more factors larger than 1:
# 54, 2x27, 3x18, 6x9, 3x3x6, 2x3x9 and 2x3x3x3.
# If we require that the factors are all squarefree only two ways remain: 3x3x6 and 2x3x3x3.
# Let's call Fsf(n) the number of ways n can be factored into one or more squarefree factors 
# larger than 1, so Fsf(54)=2.
# Let S(n) be Fsf(k) for k=2 to n.
# S(100)=193.
# Find S(10 000 000 000).



def squarefree? n 
	Math.sqrt(n) != (Math.sqrt(n)).floor 
	 # !n.modulo(3).zero?
end

def facsqfree x,y
	# p [x,y]
	# p (squarefree?(x)) === (squarefree?(y))
	(squarefree?(x)) === true and (squarefree?(y)) === true
end

class Integer
  def factors() (1..self).select { |n| (self % n).zero? } end
  def in range 
	(range.select {|n| self==n}).length > 0
  end

end

def facq n
	a=[]
	(2..Math.sqrt(n).floor).each do |f|
		if (n % f).zero? then 
			if (f <= (n/f)) then 
				a << [f,n/f]
			end
		end
	end
	a << [1,n] if squarefree?(n)
	p a.sort
	(a | a) #.select {|x| x!=[]}
end


def expandfacs x,y,acc
	if x.in([1,2,3,5,6,7,8]) then 
		acc << x 
		acc
	elsif 
		expandfacs x.modulo(y),x,acc
	end

end
 
# p 54.in [54,1,2,3,4,55,5,54]
p (54.factors) #.map {|n| n.factors}
sum = []
(54..54).each do |n|
	# if n==54 then puts "#{n} #{facq(n).length} #{facq(n)}" end
	sum << (facq(n)).length
	# sum << (n.prime_division).length
end
p sum
p sum.reduce(:+)



# class Integer
#   def factors() (1..self).select { |n| (self % n).zero? } end
#   def in range 
# 	(range.select {|n| self==n}).length > 0
#   end
#   def sqdiv?
#   	self > 3 && Math.sqrt(self) == (Math.sqrt(self)).floor
#   end
# end
# # 54, 2x27, 3x18, 6x9, 3x3x6, 2x3x9 and 2x3x3x3
# def facq n
# 	a=[]
# 	(2..Math.sqrt(n).floor).each do |f|
# 		if (n % f).zero? then 
# 			if (f <= (n/f)) then 
# 				a << [f,n/f]

# 				if f > 3 && f.factors != [1,f] then
# 					a << ([n/f,facq(f)]).flatten
# 				end

# 				if (n/f) > 3 && (n/f).factors != [1,n/f] then
# 					a << ([f,facq(n/f)]).flatten
# 				end
# 			else
# 				break
# 			end
# 		end
# 	end
# 	# a << [1,n] 
# 	(a | a)
# end

# p facq 54