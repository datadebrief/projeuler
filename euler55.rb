  # 'If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.
  # '
  # 'Not all numbers produce palindromes so quickly. For example,
  # '
  # '349 + 943 = 1292,
  # '1292 + 2921 = 4213
  # '4213 + 3124 = 7337
  # '
  # 'That is, 349 took three iterations to arrive at a palindrome.
  # 'A number that never forms a palindrome through the reverse and add process is called a Lychrel number
  # 'How many Lychrel numbers are there below ten-thousand?
  # 'In addition you are given that for every number below ten-thousand, it will either 
  # '(i) become a palindrome in less than fifty iterations, or, 
  # '(ii) no one, with all the computing power that exists, has managed so far to map it to a palindrome.

def palindrome?  x
 x = x.to_s
 x == x.reverse
end
ly = 0

(0..9999).each  do |n| 
  if palindrome? (n + ((n.to_s).reverse).to_i)
    #ignore
  else
    j = 1
    k = n
    while j < 51 do
      k = (k + ((k.to_s).reverse).to_i)
      if palindrome? k
        j = 55
       else
        j = j + 1
      end
    end
    if j != 55 
      #p k
      ly = ly +1
    end
    j = 1
  end
end
puts ly.to_s
