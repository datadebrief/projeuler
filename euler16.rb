n =  2**1000
s = n.to_s
j = []
(0..s.length-1).each do |i|
 j << s[i].strip.to_i
end
p j.reduce(:+)

