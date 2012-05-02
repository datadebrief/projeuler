require 'csv'
f = 'euler11.data.txt'

arr = CSV.read(f)
m = [] # m for matrix
arr.each {|a| m << a.map { |n| n.to_i }}

def horiz m
	max = 0
	x = 0
	(0..19).each do |j|
		(0..16).each do |i|
			x = (m[j][i..(i+3)]).reduce(:*)
			if x > max then
				max = x
				# puts "#{m[j][i..(i+3)]} #{max}"
			end
		end
	end
	max
end

def vert m
	max = 0
	x = 0
	(0..16).each do |j|
		(0..19).each do |i|
			x = (m[j..(j+3)][i]).reduce(:*)
			if x > max then
				max = x
				puts "#{m[j..(j+3)][i]} #{max}"
			end
		end
	end
	max
end

hmax = horiz m #48477312

def vert m
	v = 0
	vv = []
	max = 0
	(0..16).each do |j|
		(0..16).each do |i|
			4.times do |z|
				vv << m[j+z][i]
			end
			v = vv.reduce(:*)
			if v > max then 
				max = v 
				# puts "#{vv} #{max}"
			end
			vv = []
		end
	end
	max
end

vmax = vert m #51267216

def rdiag m
	v = 0
	vv = []
	max = 0
	(0..16).each do |j|
		(0..16).each do |i|
			4.times do |z|
				vv << m[j+z][i+z]
			end
			v = vv.reduce(:*)
			if v > max then 
				max = v 
				# puts "#{vv} #{max}"
			end
			vv = []
		end
	end
	max
end
rdmax = rdiag m

def ldiag m
	v = 0
	vv = []
	max = 0
	16.downto(0).each do |j|
		16.downto(0).each do |i|
			4.times do |z|
				vv << m[j-z][i+z]
			end
			v = vv.reduce(:*)
			if v > max then 
				max = v 
				# puts "#{vv} #{max}"
			end
			vv = []
		end
	end
	max
end
ldmax = ldiag m #70600674 

dmax = ([rdmax,ldmax]).max

vhdmax = []
vhdmax << vmax
vhdmax << hmax
vhdmax << dmax

p vhdmax.max

# 70600674 ldiag is the winner!
