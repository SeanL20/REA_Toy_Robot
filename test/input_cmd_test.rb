require "minitest/autorun"
require_relative "../model/input_cmd"

class InputCmdTest < Minitest::Test

  def setup
  	@input_cmd = InputCmd.new
  end

  # Test if input_cmd is an instance of the InputCmd class
  def test_input_command_instance
  	assert_instance_of InputCmd, @input_cmd
  end

  # Test if the place_robot would create a new instance of robot class
  def test_place_robot_instance

  	@input_cmd.place_robot("PLACE 0,0,NORTH")

  	assert_instance_of Robot, @input_cmd.robot
  end

  # Test if the place_robot would not create a robot if place command was called with coordinates outside of the board.
  def test_place_robot_instance_outside_coordinatons

    @input_cmd.place_robot("PLACE 5,5,NORTH")

    assert_equal "", @input_cmd.robot
  end

  # Test if the place_robot would not create a robot if place command was called with negative coordinates outside of the board.
  def test_place_robot_instance_outside_coordinatons_nega

    @input_cmd.place_robot("PLACE -1,-1,NORTH")

    assert_equal "", @input_cmd.robot
  end

  # Test if the place_robot would create a new instance of robot class with the correct x_position
  def test_place_robot_x_position

  	@input_cmd.place_robot("PLACE 0,0,NORTH")

  	assert_equal 0, @input_cmd.robot.x_position
  end

  # Test if the place_robot would create a new instance of robot class with the correct y_position
  def test_place_robot_y_position

  	@input_cmd.place_robot("PLACE 0,0,NORTH")

  	assert_equal 0, @input_cmd.robot.y_position
  end

  # Test if the place_robot would create a new instance of robot class with the correct facing
  def test_place_robot_facing
  	@input_cmd.place_robot("PLACE 0,0,NORTH")

  	assert_equal "NORTH", @input_cmd.robot.facing
  end

  # Test if the calling place_robot twice would update the instance
  def test_double_place_robot_instance

    @input_cmd.place_robot("PLACE 0,0,NORTH")

    @input_cmd.place_robot("PLACE 1,1,EAST")

    assert_instance_of Robot, @input_cmd.robot
  end

  # Test if the calling place_robot twice would update the x_position
  def test_double_place_robot_x_position

    @input_cmd.place_robot("PLACE 0,0,NORTH")

    @input_cmd.place_robot("PLACE 1,1,EAST")

    assert_equal "1", @input_cmd.robot.x_position
  end

  # Test if the calling place_robot twice would update the y_position
  def test_double_place_robot_y_position

    @input_cmd.place_robot("PLACE 0,0,NORTH")

    @input_cmd.place_robot("PLACE 1,1,EAST")

    assert_equal "1", @input_cmd.robot.y_position
  end

  # Test if the calling place_robot twice would update the facing
  def test_double_place_robot_facing
    @input_cmd.place_robot("PLACE 0,0,NORTH")

    @input_cmd.place_robot("PLACE 1,1,EAST")

    assert_equal "EAST", @input_cmd.robot.facing
  end

  def test_turn_left_without_place
  	@input_cmd.turn_left
  	assert_empty @input_cmd.robot
  end

  def test_turn_left_with_place
  	@input_cmd.place_robot("PLACE 0,0,NORTH")

  	@input_cmd.turn_left

  	assert_equal "WEST", @input_cmd.robot.facing
  end

  def test_turn_right_without_place
  	@input_cmd.turn_left
  	assert_empty @input_cmd.robot
  end

  def test_turn_right_with_place
  	@input_cmd.place_robot("PLACE 0,0,NORTH")

  	@input_cmd.turn_right()

  	assert_equal "EAST", @input_cmd.robot.facing
  end

  def test_move_without_place
  	@input_cmd.move_robot
  	assert_empty @input_cmd.robot
  end

  def test_move_with_place
  	@input_cmd.place_robot("PLACE 0,0,NORTH")

  	@input_cmd.move_robot

  	assert_equal 1, @input_cmd.robot.y_position
  end

  def test_report_without_place
  	@input_cmd.move_robot
  	assert_empty @input_cmd.robot
  end

  def test_report_with_place
  	@input_cmd.place_robot("PLACE 0,0,NORTH")

  	assert_equal "0,0,NORTH", @input_cmd.report_position
  end

end