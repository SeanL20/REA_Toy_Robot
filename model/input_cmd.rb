require_relative 'board'

class InputCmd
	attr_accessor :board

	# generate board class with robots as a variable to store all the robots.
	def initialize(board)
		@board = board
	end

	def input_file_import(file_path)
		file = File.open(file_path)

		file_data = file.readlines.map(&:chomp)

		file_data.each do |data|
			robot_name = data.split(": ")[0]
			command = data.split(": ")[1]
			case command
			when /PLACE/
				self.place_robot(robot_name, command)
			when "LEFT"
				self.turn_left(robot_name)
			when "RIGHT"
				self.turn_right(robot_name)
			when "MOVE"
				self.move_robot(robot_name)
			when "REPORT"
				puts self.report_position(robot_name)
			end
		end
	end

	# Place the robot with the command for the coordinates and facing.
	def place_robot(robot_name, command)
		coord = command.split(" ")[1].split(",")
		x_coord = coord[0]
		y_coord = coord[1]
		facing = coord[2]
		Robot.new(
			robot_name: robot_name, 
			x_position: x_coord, 
			y_position: y_coord, 
			facing: facing, 
			board: board
		)
	end

	# Turns the robot left if there is robot with the name found
	def turn_left(robot_name)
		robot = board.find_robot(robot_name)

		if robot != []
			case robot.facing
			when "NORTH"
				robot.facing = "WEST"
			when "SOUTH"
				robot.facing = "EAST"
			when "EAST"
				robot.facing = "NORTH"
			when "WEST"
				robot.facing = "SOUTH"
			end
		end
	end

	# Turns the robot right if there is robot with the name found
	def turn_right(robot_name)
		robot = board.find_robot(robot_name)

		if robot != []
			case robot.facing
			when "NORTH"
				robot.facing = "EAST"
			when "SOUTH"
				robot.facing = "WEST"
			when "EAST"
				robot.facing = "SOUTH"
			when "WEST"
				robot.facing = "NORTH"
			end
		end
	end

	# Moves The Robot By One Depending On The Facing.
	def move_robot(robot_name)
		robot = board.find_robot(robot_name)
		if robot != []
			case robot.facing
			when "NORTH"
				if !robot.y_hit_north_border? && !robot.y_move_to_north_edge?
					robot.y_position = robot.y_position + 1
				end
			when "SOUTH"
				if !robot.y_hit_south_border? && !robot.y_move_to_south_edge?
					robot.y_position = robot.y_position - 1
				end
			when "EAST"
				if !robot.x_hit_east_border? && !robot.x_move_to_east_edge?
					robot.x_position = robot.x_position + 1
				end
			when "WEST"
				if !robot.x_hit_west_border? && !robot.x_move_to_west_edge?
					robot.x_position = robot.x_position - 1
				end
			end
		end
	end

	def report_position(robot_name)
		robot = board.find_robot(robot_name)

		if robot != []
			string = "#{robot.robot_name}: #{robot.x_position},#{robot.y_position},#{robot.facing}"
			return string
		end
	end
end