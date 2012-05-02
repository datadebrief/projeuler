# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over 
# five-thousand first names, begin by sorting it into alphabetical order. 
# Then working out the alphabetical value for each name, multiply this value by its 
# alphabetical position in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order, COLIN, 
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. 
# So, COLIN would obtain a score of 938  53 = 49714.
# What is the total of all the name scores in the file?


require 'csv'
f = 'names2.txt'

arr = CSV.read(f)
arr.sort!

def alphaidx z
	a = z #.to_upper
	az = ("A".."Z").to_a
	az.index(a)+1
end
total = 0
(arr.length).times do |a|
	if a < 2 then p a end
	total = total + ((a+1) * (((arr[a].join.split('')).collect {|z| alphaidx z}).reduce(:+)))
end
p total




