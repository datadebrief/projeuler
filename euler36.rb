
# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# (Please note that the palindromic number, in either base, may not include leading zeros.)

def palindrome?  x
 x.to_s == (x.to_s).reverse
end

base10s = []
base2s = []


(1..10**6).each do |n|
	if (palindrome? n) then base10s<<n end
end

base10s.each do |b|
	if (palindrome? b.to_s(base=2)) then base2s << b end
end

p base2s.reduce(:+)
