require_relative 'robot'

class InputCmd
	attr_accessor :robot

	def initialize
		@robot = ""
	end

	# Input Command For The Function.
	def input_file_import(file_path)
		file = File.open(file_path)

		file_data = file.readlines.map(&:chomp)

		file_data.each do |data|
			case data
			when /PLACE/
				self.place_robot(data)
			when "LEFT"
				self.turn_left
			when "RIGHT"
				self.turn_right
			when "MOVE"
				self.move_robot
			when "REPORT"
				puts self.report_position
			end
		end
	end

	# Place the robot with the command for the coordinates and facing.
	def place_robot(command)
		coord = command.split(" ")[1].split(",")
		x_coord = coord[0]
		y_coord = coord[1]
		facing = coord[2]

		if @robot == ""
			@robot = Robot.new(
				x_position: x_coord, 
				y_position: y_coord, 
				facing: facing
			)
		else
			@robot.x_position = x_coord
			@robot.y_position = y_coord
			@robot.facing = facing
		end
	end

	# Turns the robot left if there is robot with the name found
	def turn_left
		if @robot != ""
			case @robot.facing
			when "NORTH"
				@robot.facing = "WEST"
			when "SOUTH"
				@robot.facing = "EAST"
			when "EAST"
				@robot.facing = "NORTH"
			when "WEST"
				@robot.facing = "SOUTH"
			end
		end
	end

	# Turns the robot right if there is robot with the name found
	def turn_right
		if @robot != ""
			case @robot.facing
			when "NORTH"
				@robot.facing = "EAST"
			when "SOUTH"
				@robot.facing = "WEST"
			when "EAST"
				@robot.facing = "SOUTH"
			when "WEST"
				@robot.facing = "NORTH"
			end
		end
	end

	# Moves The Robot By One Depending On The Facing.
	def move_robot
		if @robot != ""
			case @robot.facing
			when "NORTH"
				if !@robot.y_hit_north_border?
					@robot.y_position = @robot.y_position + 1
				end
			when "SOUTH"
				if !@robot.y_hit_south_border?
					@robot.y_position = @robot.y_position - 1
				end
			when "EAST"
				if !@robot.x_hit_east_border?
					@robot.x_position = @robot.x_position + 1
				end
			when "WEST"
				if !@robot.x_hit_west_border?
					@robot.x_position = @robot.x_position - 1
				end
			end
		end
	end

	def report_position
		if @robot != ""
			string = "#{robot.x_position},#{robot.y_position},#{robot.facing}"
			return string
		end
	end
end