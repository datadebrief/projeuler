# n = (28433 * 2**7830457) +1

# n = 123456789987654321
# p n[-10]

# n = Math.sqrt 4321
# p n
# p n.round(0)

# p n.to_s.length

# n = 4321

def append fi,c
	File.open( fi, "a" ) {| f | f.puts c } 
end

def rndsqrt n
	# Let d be the number of digits of the number n.
	# If d is odd, set x0 = 2x10(d-1)⁄2.
	# If d is even, set x0 = 7x10(d-2)⁄2.
	d = n.to_s.length
	x0 = 0.0
	if d.odd? then
		x0 = 2*(10**((d-1)/2))
	else
		x0 = 7*(10**((d-2)/2))
	end
	nextx = 1.0
	xk = x0
	i=1.0
	while nextx != xk
		# p xk
		xk = nextx unless nextx===1.0
		nextx = (((xk*1.0) + ((n/(xk*1.0)).ceil))/2.0).floor
		i += 1.0
	end
	# p i
	# p xk
	i
end

# p rndsqrt 4321

its = []
# 10,000  n  99,999
(10000000000000..100000000000000).each do |n|
	its << rndsqrt(n)
	if (its.length).modulo(5000) == 0 then 
		append("output.txt", its) 
		its.clear
	end
end
append("output.txt", its) 
puts "done"
# p its.length
# p its[1..20]
# x = (its.reduce(:+)/(its.length * 1.0))-1.0
# p x
# p x.round(10)

# p Math.sqrt(15555)
# p rndsqrt 15555