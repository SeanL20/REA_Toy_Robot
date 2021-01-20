require "minitest/autorun"
require_relative "../model/input_cmd"

class InputCmdTest < Minitest::Test

  def setup
  	@board = Board.new

  	@input_cmd = InputCmd.new(@board)
  end

  # Test if input_cmd is an instance of the InputCmd class
  def test_input_command_instance
  	assert_instance_of InputCmd, @input_cmd
  end

  # Test if the place_robot would create a new instance of robot class
  def test_place_robot_instance

  	@input_cmd.place_robot("TEST", "PLACE 0,0,NORTH")

  	assert_instance_of Robot, @board.find_robot("TEST")
  end

  # Test if the place_robot would create a new instance of robot class with the correct name
  def test_place_robot_name

  	@input_cmd.place_robot("TEST", "PLACE 0,0,NORTH")

  	assert_equal "TEST", @board.find_robot("TEST").robot_name
  end

  # Test if the place_robot would create a new instance of robot class with the correct x_position
  def test_place_robot_x_position

  	@input_cmd.place_robot("TEST", "PLACE 0,0,NORTH")

  	assert_equal 0, @board.find_robot("TEST").x_position
  end

  # Test if the place_robot would create a new instance of robot class with the correct y_position
  def test_place_robot_y_position

  	@input_cmd.place_robot("TEST", "PLACE 0,0,NORTH")

  	assert_equal 0, @board.find_robot("TEST").y_position
  end

  # Test if the place_robot would create a new instance of robot class with the correct facing
  def test_place_robot_facing
  	@input_cmd.place_robot("TEST", "PLACE 0,0,NORTH")

  	assert_equal "NORTH", @board.find_robot("TEST").facing
  end

  def test_turn_left_without_place
  	@input_cmd.turn_left("TEST")
  	assert_empty @board.find_robot("TEST")
  end

  def test_turn_left_with_place
  	@input_cmd.place_robot("TEST", "PLACE 0,0,NORTH")

  	@input_cmd.turn_left("TEST")

  	assert_equal "WEST", @board.find_robot("TEST").facing
  end

  def test_turn_right_without_place
  	@input_cmd.turn_left("TEST")
  	assert_empty @board.find_robot("TEST")
  end

  def test_turn_right_with_place
  	@input_cmd.place_robot("TEST", "PLACE 0,0,NORTH")

  	@input_cmd.turn_right("TEST")

  	assert_equal "EAST", @board.find_robot("TEST").facing
  end

  def test_move_without_place
  	@input_cmd.move_robot("TEST")
  	assert_empty @board.find_robot("TEST")
  end

  def test_move_with_place
  	@input_cmd.place_robot("TEST", "PLACE 0,0,NORTH")

  	@input_cmd.move_robot("TEST")

  	assert_equal 1, @board.find_robot("TEST").y_position
  end

  def test_report_without_place
  	@input_cmd.move_robot("TEST")
  	assert_empty @board.find_robot("TEST")
  end

  def test_report_with_place
  	@input_cmd.place_robot("TEST", "PLACE 0,0,NORTH")

  	assert_equal "TEST: 0,0,NORTH", @input_cmd.report_position("TEST")
  end

end