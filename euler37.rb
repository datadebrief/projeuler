require "prime"
# def prime_sieve n
# 	primes=[]
# 	Prime.each {|pr| primes << pr ; break if pr > n }
# 	primes
# end

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

def trunc n
	x = n.to_s
	xlen = x.length-1
	is = false
	#left
	(0..xlen).each do |t|
		# if n==3797 then puts "#{n} #{x[t,x.length]}" end
		if ((x[t,x.length]).to_i).prime? then 
			is = true 
		else
			is = false
			break
		end
	end
	#right
	if is then
		(xlen).downto(0).each do |t|
			# if n==3797 then puts "#{n} #{x[0,x.length-t]}" end
			if ((x[0,x.length-t]).to_i).prime? then 
				# p x[0,t]
				is = true 
			else
				is = false
				 break
			end
		end
	end
	is
end

def truncprimes n
	truncs =[]
	i = 0
	Prime.each do |pr|
		if pr > 7 then
			if trunc(pr) then truncs <<  pr ; i+=1; end
		end
		break unless pr < n
		break unless i < 11
	end
	truncs
end

z = 1000001
a = truncprimes z
puts "**********************"
p a
p a.length
# zz = a #a[a.length-11,a.length]
# p zz
p a.reduce(:+)
# p 313.factors

# Prime.each do |x|
# 	p x
# 	if x > 7 then break end
# end

# **********************
# [23, 37, 53, 73, 313, 317, 373, 797, 3137, 3797, 739397]
# 11
# 748317
# [Finished]