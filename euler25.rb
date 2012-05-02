def fib n
 fib_iter(1,0,n)
end

def fib_iter a,b,count
  if (count == 0) then
   b
  else 
	fib_iter(a+b,a,count-1)
  end
end

x,i=0,0
while x.to_s.length < 1000
 i = i+1
 x=fib(i)
 if x.to_s.length >= 1000 then
 	puts i
 end
end
puts i
# puts x