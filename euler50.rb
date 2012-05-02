require "prime"
# The prime 41, can be written as the sum of six consecutive primes:
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# The longest sum of consecutive primes below one-thousand that adds to a prime, 
# contains 21 terms, and is equal to 953.
# Which prime, below one-million, can be written as the sum of the most consecutive primes?
class Integer
 require "prime"

  def factors() (1..self).select { |n| (self % n).zero? } end
  def prime? 
  	is = false
  	# if self.factors.length == 2 then puts "#{self.factors} #{self.factors.length}" end 
  	# if self < 20 then self. end
  	self.factors.length == 2
  end
end
def primes n
	ps=[0]
	Prime.each do |pr| 
		if pr <= n then
			ps << pr 
		else
			break
		end
	end
	ps
end

def prime_sieve n
	primes=[0]
	z=0
	Prime.each do |pr| 
		if z + pr < n then 
			z += pr
			primes << pr
		end
		break if z + pr >= n
	end
	primes
end

pr = (primes 1000000)
# p pr
# p pr.length
out = false
finds = []
len=0
(pr.length - 1).downto(1) do |x|
  (1..pr.length-1).each do |y|
  	  (y..pr.length-1).each do |z|
  	  	if (pr[y..z]).reduce(:+) > pr[x] then break end
	  	if (pr[y..z]).reduce(:+) == pr[x] && y !=z then 
	  		# p pr[1..y]
	  		# p (pr[1..y]).length
		  	# puts "#{pr[x]} #{x}.#{y}..#{z} = #{z-y}" 
		  	# out = true
		  	if (pr[y..z]).length > len then
		  	 finds << pr[y..z] 
		  	 len = (pr[y..z]).length
		  	end
			# break
		end
	end
  end
  # if out then break end
end
# p pr[0..6].reduce(:+) 
#21 terms, 953
# p finds
l = 0
finds.each  do |f|
	if f.length > l then 
		l = f.length
		# puts f
		zz = f.reduce(:+)
		if zz.prime? then
			puts zz
		end
	end
end