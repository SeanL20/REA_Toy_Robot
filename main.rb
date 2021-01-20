require_relative 'model/input_cmd'

def main
	input_file = ARGV[0]

	input_commands = InputCmd.new

	input_commands.input_file_import(input_file)
end

main