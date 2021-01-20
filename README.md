# REA_Toy_Robot
This repository is for the coding assessment for REA.

# Creation Process
There will be 3 model classes:
- The robot class is to create individual robot classes and have checks for the robot if it would hit the border or moves towards the edge.
- The board class is to store the robot classes as well as finding the robot by name.
- The input command class contain functionality for the input file that would place, turn and move the robot as well as reports the robot position.

# Testing
The main testing file are in the test folder where it would test the creation of the Board, InputCmd and Robot classes as well as the inbuild helper of function of the classes.

To run the test do enter the following commands:
```
ruby test/robot_test.rb
ruby test/board_test.rb
ruby test/input_cmd_test.rb
```

# Running
There is no need for any setup as long as the input text file exists.
The command to run the file would be the following:
```
ruby main.rb [input text file]
```