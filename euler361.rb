# Performs various operations on the binary representations of the Bignum. 
# ~ big	Invert bits
# big	|	aNumeric	Bitwise OR
# big	&	aNumeric	Bitwise AND
# big	^	aNumeric	Bitwise EXCLUSIVE OR
# big	<<	aNumeric	Left-shift aNumeric bits
# big	>>	aNumeric	Right-shift aNumeric bits (with sign extension)

def xor z
	# given string, replace 0 with 1, and 1 with 0
	z.gsub(/1/,'2').gsub(/0/,'1').gsub(/2/,'0')
end
# def TMseq
	tn = []
	# n = 0
	
	tn << 0.to_s(2)

	(1..7).each do |n|
		k = (tn[n-1])
		tn << "#{k}#{xor(k)}"
		p tn[n]
	end

z = tn[7]
(1..z.length).each do |x|
	p (z[0..x]).to_i(2)
end