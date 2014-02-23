#scene class for tdd homework COSI 236b
#Ken Harsch
#kharsch@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'
require_relative 'point.rb'
require_relative 'circle.rb'
require_relative 'rectangle.rb'
require_relative 'triangle.rb'

class Scene
	attr_reader
	def initialize
		@scene = []
	end

	def add_shape(shape)
		@scene << shape
	end

	def remove_shape(shape)
		@scene.delete_if {|entry| entry == shape}
	end

	def shape_count
		return @scene.length
	end

	def total_area
		t_area = 0
		@scene.each do |entry|
			t_area += entry.area
		end
		return t_area
	end
end


describe Scene do
	before do
		@p1 = Point.new(1, 1)
		@p2 = Point.new(1, 4)
		@p3 = Point.new(5, 4)
		@p4 = Point.new(5, 1)
		@p5 = Point.new(3, 3)
		@radius = 3
		@a_circle = Circle.new(@p5, @radius)
		@a_circle_2 = Circle.new(@p3, 4)
		@a_rectangle = Rectangle.new(@p1, @p2, @p3, @p4)
		@a_triangle = Triangle.new(@p1, @p5, @p4)
		@a_scene = Scene.new
		@a_scene.add_shape(@a_circle)
		@a_scene.add_shape(@a_rectangle)
		@a_scene.add_shape(@a_triangle)
	end

	it "can count the number of shapes in the scene" do
		@a_scene.shape_count.must_equal 3
	end

	it "can return the total area" do
		@a_scene.total_area.must_equal (@a_circle.area + @a_rectangle.area + @a_triangle.area)
	end

	it "can add a shape" do
		@a_scene.add_shape(@a_circle_2)
	end

	it "can remove a shape" do
		@a_scene.remove_shape(@a_circle_2)
	end

end