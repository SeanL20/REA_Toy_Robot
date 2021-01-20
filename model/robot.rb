class Robot
	attr_accessor :robot_name, :x_position, :y_position, :facing
  attr_reader :board

  # Initialize a robot class & link to the board class so that the robot can be display as an array.
	def initialize(robot_name:, x_position:, y_position:, facing:, board:)
		@robot_name = robot_name
		@x_position = x_position.to_i
		@y_position = y_position.to_i
		@facing = facing
		@board = board

		@board.robots << self
	end

	# Get the boolean if the robot in the position that it would hit the north border if it moves in the y axis.
	def y_hit_north_border?
		@y_position == 6
	end

	# Get the boolean if the robot in the position that it would hit the south border if it moves in the y axis.
	def y_hit_south_border?
		@y_position == 0
	end

	# Get the boolean if the robot would move to the north edge (y coord of 6) if it moves in the y axis.
	def y_move_to_north_edge?
		(y_position + 1) >= 6
	end

	# Get the boolean if the robot would move to the south edge (y coord of 0) if it moves in the y axis.
	def y_move_to_south_edge?
		(y_position - 1) <= 0
	end

	# Get the boolean if the robot in the position that it would hit the east border if it moves in the x axis.
	def x_hit_east_border?
		x_position == 6
	end

	# Get the boolean if the robot in the position that it would hit the west border if it moves in the x axis.
	def x_hit_west_border?
		x_position == 0
	end

	# Get the boolean if the robot would move to the east edge (x coord of 6) if it moves in the x axis.
	def x_move_to_east_edge?
		(x_position + 1) >= 6
	end

	# Get the boolean if the robot would move to the west edge (x coord of 0) if it moves in the x axis.
	def x_move_to_west_edge?
		(x_position - 1) <= 0
	end
end