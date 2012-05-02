def soundexnum n
	nums = { 1=> 'one',
2=> 'two',
3=> 'three',
4=> 'four',
5=> 'five',
6=> 'six',
7=> 'seven',
8=> 'eight',
9=> 'nine',
10=> 'ten',
11=> 'eleven',
12=> 'twelve',
13=> 'thirteen',
14=> 'fourteen',
15=> 'fifteen',
16=> 'sixteen',
17=> 'seventeen',
18=> 'eighteen',
19=> 'nineteen',
20=> 'twenty',
30=> 'thirty',
40=> 'forty',
50=> 'fifty',
60=> 'sixty',
70=> 'seventy',
80=> 'eighty',
90=> 'ninety',
100=> 'hundred',
1000=> 'one thousand'
}
	if n <= 20 then 
		nums[n]
	elsif n/10 >= 2 && n/10 < 10 then
		"#{nums[n - (n.modulo(10).floor)]} #{nums[n.modulo(10)]}"
	elsif n.to_s.length == 3 then
		if n.modulo(100) == 0 then 
			"#{nums[(n/100).floor]} hundred"
		else
		"#{nums[(n/100).floor]} hundred and #{soundexnum n.modulo(100)}"
	    end
	elsif n == 1000 then
		nums[n]
	end
end
# p nums
str = []
lens = 0

(1..1000).each do |x|
	sx = soundexnum(x)
	str << sx
	lens = lens + (sx.gsub(/\s/,'')).strip.length
end

# puts str.join("\n")
puts lens
