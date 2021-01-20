require "minitest/autorun"
require_relative "../model/robot"

class RobotTest < Minitest::Test

  def setup
    @robot = Robot.new(
			x_position: 0, 
			y_position: 0, 
			facing: "NORTH"
		)
  end

  # Test if robot is an instance of the robot class
  def test_robot_instance
  	assert_instance_of Robot, @robot
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

  # Test the functionality of the hit west border
 	def test_robot_hit_west_border
    assert_equal true, @robot.x_hit_west_border?
  end

  # Test the functionality of the hit east border
 	def test_robot_hit_east_border
    assert_equal false, @robot.x_hit_east_border?
  end

end