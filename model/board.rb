require_relative 'robot'

class Board
	attr_accessor :robots

	# generate board class with robots as a variable to store all the robots.
	def initialize()
		@robots = []
	end

	# function to search the robots array for the robot with the inputted name and return the class.
	def find_robot(name)
		robots.each do |robot|
			return robot if robot.robot_name == name
		end
	end
end