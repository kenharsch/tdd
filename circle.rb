#circle class for tdd homework COSI 236b
#Ken Harsch
#kharsch@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'
require_relative 'point.rb'

class Circle
	attr_reader :center, :radius, :area
	#initializes a circle, takes a point(point.rb) and a radius which is converted 
	#to a float value, initializes a calculation of the area
	def initialize (point, radius)
		@point = point
		@radius = radius.to_f
		calculate_area
	end

	def center
		#defines the center as the point
		return @point
	end

	def calculate_area
		#calculates area = pi r^2
		@area = (Math::PI * @radius * @radius)
	end

end

describe Circle do 

	before do
		#creates a ew circle around the point x = 3, y = 5, with a radius of 5
		@point = Point.new(3, 5)
		@a_circle = Circle.new(@point, 5)
	end
	#checks to see that radius is of Float type
	it "will have a float as it's radius" do
		@a_circle.radius.must_be_instance_of Float
	end
	#checks to see that the center is returned as type Point
	it "will return a point as it's center" do
		@a_circle.center.must_be_instance_of Point
	end
	#checks to see that the correct point is returned as the center
	it "will return it's center" do
		@a_circle.center.must_equal @point
	end
	#checks to see that the correct radius is returned
	it "will return it's radius" do
		@a_circle.radius.must_equal 5
	end
	#checks to see that the correct area is returned
	it "will return it's area" do
		@a_circle.area.must_equal (Math::PI * 25)
	end 

end