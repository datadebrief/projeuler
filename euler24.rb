# a = (0..9).to_a
# b = (a.permutation.to_a).sort
# # p b.length
# c = b[1000000-1]
# puts c.to_s.gsub(/,/,'').gsub(/\s/,'')

# 2783915460

p (0..9).to_a.permutation.to_a[999999].join.to_i