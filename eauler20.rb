# Find the sum of the digits in the number 100!

n =  (1..100).reduce(:*)
s = n.to_s
j = []

(0..s.length-1).each do |i|
 j << s[i].strip.to_i
end
p j.reduce(:+)

# p ((0..n).to_a).reduce(:+)