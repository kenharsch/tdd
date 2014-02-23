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
	#initializes a scene as an empty array
	def initialize
		@scene = []
	end
	#pushes a shape onto the end of the array
	def add_shape(shape)
		@scene << shape
	end
	#checks for an instance or the shape passed in in the array
	#deletes the instance if found
	def remove_shape(shape)
		@scene.delete_if {|entry| entry == shape}
	end
	#returns the length of the scene array, which is a count of the shapes
	def shape_count
		return @scene.length
	end
	#iterates through the scene array and adds the area of each shape
	#to the total area, returns a total of the area of all shapes
	def total_area
		t_area = 0
		@scene.each do |entry|
			t_area += entry.area
		end
		return t_area
	end
end


describe Scene do
	#creates 5 instances of Point (point.rb) and a radius to use to create shapes
	#creates 2 circles, a rectangle and a triangle using the points
	#creates a new scene object and pushes a circle, rectangle and triangle onto
	#the scene array
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
	#checks to see that the number of entries in the scene array is correct
	it "can count the number of shapes in the scene" do
		@a_scene.shape_count.must_equal 3
	end
	#checks to see that the total_area method returns the correct value
	it "can return the total area" do
		@a_scene.total_area.must_equal (@a_circle.area + @a_rectangle.area + @a_triangle.area)
	end
	#adds a second circle to the scene array, checks the array length
	#to show that it was added
	it "can add a shape" do
		@a_scene.add_shape(@a_circle_2)
		@a_scene.shape_count.must_equal 4
	end
	#removes the second circle from the scene array, checks the array length
	#to show that the operation was successful
	it "can remove a shape" do
		@a_scene.remove_shape(@a_circle_2)
		@a_scene.shape_count.must_equal 3
	end

end