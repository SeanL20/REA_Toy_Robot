require_relative 'model/input_cmd'

def main
	input_file = ARGV[0]
	
	board = Board.new

	input_commands = InputCmd.new(board)

	input_commands.input_file_import(input_file)
end

main