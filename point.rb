#point class and tests for tdd homework cs236b
#Ken Harsch
#kharsch@brandeis.edu

require 'minitest/spec'
require 'minitest/autorun'

class Point
	attr_reader :x, :y

	def initialize (x, y)
		@x = x.to_f
		@y = y.to_f
	end
end


describe Point do 

	before do
		@a_point = Point.new(4, 6)
	end

	it "will return an x value" do
		@a_point.x.must_equal 4
	end

	it "will return a y value" do
		@a_point.y.must_equal 6
	end
	
end