# Find the number of characters saved by writing each of these in their minimal form.
# roman.txt
# Note: You can assume that all the Roman numerals in the file contain no more than four consecutive identical units.
# Numerals must be arranged in descending order of size.
# Only I, X, and C can be used as the leading numeral in part of a subtractive pair.
# I can only be placed before V and X.
# X can only be placed before L and C.
# C can only be placed before D and M.


def rom2dec rnum
	romannumerals = {"I"=>1, "V"=>5, "X"=>10, "L"=>50, "C"=>100, "D"=>500,"M"=>1000}
	rnumlen = rnum.length
	val = 0
	(rnum.split('')).each  do |a|
		val = val + (romannumerals["#{a.to_s}"]).to_i
	end
	#puts "#{rnum} = #{val.to_s}"
	if (rnum.gsub(/C[MD]/,'')).length != rnumlen
		val = val - 200
	end
	if (rnum.gsub(/X[CL]/,'')).length != rnumlen
		val = val - 20
	end
	if (rnum.gsub(/I[VX]/,'')).length != rnumlen
		val = val - 2
	end		
	val
end


def dec2rom n
# multiply romanmultis by n/romanmultis
	# romanmultipliers = [1000,500,100,50,10,5,1]
	# romannumerals = ['M','D','C','L','X','V','I']
	romannumerals = {"I"=>1, "V"=>5, "X"=>10, "L"=>50, "C"=>100, "D"=>500,"M"=>1000}
# p n
	n=n.to_i
	roman = ''
	rem = 0

	remM = n/1000
	romanM = 'M' * (remM)
	rem = n - (remM * 1000)
# p rem
	remD = rem/500
	romanD = 'D' * (remD)
	rem = rem - (remD * 500)
# p rem	
	remC = rem/100
	romanC = 'C' * (remC)
	rem = rem - (remC * 100)
# p rem
	remL = rem/50
	romanL = 'L' * (remL)
	rem = rem - (remL * 50)
# p rem
	remX = rem/10
	romanX = 'X' * (remX)
	rem = rem - (remX * 10)
# p rem
	remV = rem/5
	romanV = 'V' * (remV)
	rem = rem - (remV * 5)
# p rem
	remI = rem/1
	romanI = 'I' * (remI)
	rem = rem - (remI * 1)
# p rem
	roman = "#{romanM}#{romanD}#{romanC}#{romanL}#{romanX}#{romanV}#{romanI}"
	roman = roman.sub(/DDDD/,'DM').sub(/CCCC/,'CD').sub(/XXXX/,'XL').sub(/IIII/,'IV')
	roman = roman.sub(/DCD/,'CM').sub(/VIV/,'IX').sub(/LXL/,'XC')
	roman.strip
end

# z = "M"
# p romannumerals["#{z}"]
prechars = 0
postchars = 0
pretotal = 0
posttotal = 0
IO.foreach("roman.txt") { |line| 
	l = line.strip
	
 	if l.length > 0 
 		prechars = prechars + l.length
 		pretotal = pretotal + rom2dec(l)
 		posttotal = posttotal + rom2dec(dec2rom(rom2dec(l)))
 		postchars = postchars + (dec2rom(rom2dec(l))).length
	end
}
# p prechars
# p postchars
 p prechars - postchars

if pretotal == posttotal
	puts "XCheck OK!"
else
	p pretotal
	p posttotal
end
# p rom2dec 'MMMDXXXVI'
# # p dec2rom (rom2dec 'XVIIII')
#  p dec2rom 3536
# p rom2dec 'MCMXCV'
# p rom2dec 'XIX' # M.M.M.M.CCXLI
# p rom2dec 'XVIIII'
# p 2200.modulo(1000)