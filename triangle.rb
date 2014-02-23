#triangle class for tdd COSI 236b
#Ken Harsch
#kharsch@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'
require_relative 'point.rb'

class Triangle
	attr_reader :p1, :p2, :p3, :area
	#initializes the triangle as a collection of three bojects of type Point
	#initializes a calculation of the area
	def initialize(p1, p2, p3)
		@p1 = p1
		@p2 = p2
		@p3 = p3
		calculate_area
	end
	#checks the validity of the triangle by checking to see that
	#none of the three points lie on the same line
	def valid?
		if p1.x == p2.x && p1.x == p3.x
			return false
		elsif p1.y == p2.y && p1.y == p3.y
			return false
		else
			return true
		end
	end
	#calculates the area of the triangle using base * height/2
	#height is defined as the difference between the y values of the first and second points
	def calculate_area
		@height =  (p2.y - p1.y).abs
		@base = (p3.x - p1.x).abs
		@area = (@height * @base)/2
	end

end

describe Triangle do
	#creates a new triangle object from objects of type Point(point.rb)
	before do 
		@point1 = Point.new(1, 1)
		@point2 = Point.new(3, 3)
		@point3 = Point.new(5, 1)
		@a_triangle = Triangle.new(@point1, @point2, @point3)
	end
	#checks validity of the triangle
	it "creates a valid triangle" do
		@a_triangle.valid?.must_equal true
	end
	#checks that the area is correct
	it "returns the area" do
		@a_triangle.area.must_equal 4
	end

end