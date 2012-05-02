require 'date'
#euler 19
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
suns = 0
(1901..2000).each do |y|
	(1..12).each do |m|
		if (Date.new(y,m,1)).sunday? then suns += 1 end
	end
end
p suns
