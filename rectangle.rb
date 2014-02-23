#rectangle class for tdd homwork COSI 236b
#Ken Harsch
#kharsch@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'
require_relative 'point.rb'

class Rectangle
	attr_reader :p1, :p2, :p3, :p4, :area
	
	def initialize (p1, p2, p3, p4)
		@p1 = p1
		@p2 = p2
		@p3 = p3
		@p4 = p4
		calculate_area
	end

	def valid?
		if @p1.x == @p2.x && @p2.y == @p3.y && @p3.x == @p4.x && @p4.y == @p1.y
			return true
		else
			return false
		end
	end

	def calculate_area
		@area = (p2.y - p1.y) * (p4.x - p1.x)
	end

end





describe Rectangle do
	before do
		@point1 = Point.new(1, 1)
		@point2 = Point.new(1, 4)
		@point3 = Point.new(5, 4)
		@point4 = Point.new(5, 1)
		@a_rectangle = Rectangle.new(@point1, @point2, @point3, @point4)
	end

	it "creates a valid rectangle" do
		@a_rectangle.valid?.must_equal true
	end

	it "returns it's area" do 
		@a_rectangle.area.must_equal 12
	end

end