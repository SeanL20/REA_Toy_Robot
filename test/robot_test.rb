require "minitest/autorun"
require_relative "../model/board"

class RobotTest < Minitest::Test

  def setup
  	board = Board.new

    @robot = Robot.new(
			robot_name: "TEST", 
			x_position: 0, 
			y_position: 0, 
			facing: "NORTH", 
			board: board
		)
  end

  # Test if robot is an instance of the robot class
  def test_robot_instance
  	assert_instance_of Robot, @robot
  end

  # Test the storing of robot_name
  def test_robot_name
    assert_equal "TEST", @robot.robot_name
  end

  # Test the storing of x_position
 	def test_robot_x_position
    assert_equal 0, @robot.x_position
  end

  # Test the storing of y_position
 	def test_robot_y_position
    assert_equal 0, @robot.x_position
  end

  # Test the storing of facing
 	def test_robot_facing
    assert_equal "NORTH", @robot.facing
  end

  # Test the functionality of the hit north border
 	def test_robot_hit_north_border
    assert_equal false, @robot.y_hit_north_border?
  end

  # Test the functionality of the hit south border
 	def test_robot_hit_south_border
    assert_equal true, @robot.y_hit_south_border?
  end

  # Test the functionality of the move north edge
 	def test_robot_move_north_edge
    assert_equal false, @robot.y_move_to_north_edge?
  end

  # Test the functionality of the move south edge
 	def test_robot_move_south_edge
    assert_equal true, @robot.y_move_to_south_edge?
  end

  # Test the functionality of the hit west border
 	def test_robot_hit_west_border
    assert_equal true, @robot.x_hit_west_border?
  end

  # Test the functionality of the hit east border
 	def test_robot_hit_east_border
    assert_equal false, @robot.x_hit_east_border?
  end

  # Test the functionality of the move west edge
 	def test_robot_move_west_edge
    assert_equal true, @robot.x_move_to_west_edge?
  end

  # Test the functionality of the move east edge
 	def test_robot_move_east_edge
    assert_equal false, @robot.x_move_to_east_edge?
  end

end