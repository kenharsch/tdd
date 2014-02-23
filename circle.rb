#circle class for tdd homework COSI 236b
#Ken Harsch
#kharsch@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'
require_relative 'point.rb'

class Circle
	attr_reader :center, :radius, :area

	def initialize (point, radius)
		@point = point
		@radius = radius.to_f
		calculate_area
	end

	def center
		return @point
	end

	def calculate_area
		@area = (Math::PI * @radius * @radius)
	end

end

describe Circle do 

	before do
		@point = Point.new(3, 5)
		@a_circle = Circle.new(@point, 5)
	end

	it "will have a float as it's radius" do
		@a_circle.radius.must_be_instance_of Float
	end

	it "will return a point as it's center" do
		@a_circle.center.must_be_instance_of Point
	end

	it "will return it's center" do
		@a_circle.center.must_equal @point
	end

	it "will return it's radius" do
		@a_circle.radius.must_equal 5
	end

	it "will return it's area" do
		@a_circle.area.must_equal (Math::PI * 25)
	end 

end