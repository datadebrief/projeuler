# In laser physics, a "white cell" is a mirror system that acts as a delay line for the laser beam. 
# The beam enters the cell, bounces around on the mirrors, and eventually works its way back out.
# The specific white cell we will be considering is an ellipse with the equation 4x2 + y2 = 100
# The section corresponding to -0.01 >= x  <= +0.01 at the top is missing, 
# allowing the light to enter and exit through the hole.
# The light beam in this problem starts at the point (0.0,10.1) just outside the white cell, 
# and the beam first impacts the mirror at (1.4,-9.6).
# Each time the laser beam hits the surface of the ellipse, it follows the usual law of reflection 
# "angle of incidence equals angle of reflection." That is, both the incident and reflected beams
# make the same angle with the normal line at the point of incidence.
# In the figure on the left, the red line shows the first two points of contact between the laser beam 
# and the wall of the white cell; the blue line shows the line tangent to the ellipse at the point of 
# incidence of the first bounce.
# The slope m of the tangent line at any point (x,y) of the given ellipse is: m = -4x/y
# The normal line is perpendicular to this tangent line at the point of incidence.
# The animation on the right shows the first 10 reflections of the beam.
# How many times does the beam hit the internal surface of the white cell before exiting?
# http://0x5a4d.blogspot.com/2009/03/projecteuler-problem-144.html

def exit? x
	(x >= -0.01 && x <= 0.01)?true:false
end 

def slopem0 x1,x2,y1,y2
	# calculate the slope m0: (yO-yA)/(xO-xA)
	((y2-y1)/(x2-x1)).round(4)
end

def slopem1 x,y
	#  m1
	y != 0? ((-4*x)/y).round(4) : 0
end

def ellipseY x
	# 4x^2 + y^2 = 100
	y = 4 * (x*x) - 100
	ysqrt =	(Math.sqrt(y.abs)).round(4)
	y == y.abs ? ysqrt : -(ysqrt)
end

def ellipseX y
	x = (100 - (y*y))/4
	xsqrt =(Math.sqrt(x.abs)).round(4)
	x == x.abs ? xsqrt : -(xsqrt)
end

def rad2deg r
	r * (180/Math::PI)
end
def deg2rad d
	d * (Math::PI/180)
end

xs = (-5..5)
ys = []
xs.each do |x|
	y = ellipseY(x)
	ys << y
	puts "#{x},#{y}"
end

s=slope 1.4,-9.6
p ellipseX(-9.6)
p '-------'
p s
p (Math.atan( s))
# p  Math.asin(Math.sin(deg2rad 30).round(4))
