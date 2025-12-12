#!/usr/bin/env python3

from sys import stdin, stdout

# declare global variables to track orientation and blocks in each cardinal direction
orientation = 'n'
coordinate = (0, 0)
operands = {'n': ('-=', 'y'), 'e': ('+=', 'x'), 's': ('+=', 'y'), 'w': ('-=','x')}
seen = [(0, 0)]
duplicates = []
directions = [(direction.strip()[0], direction.strip()[1:]) for direction in stdin.read().split(",")]


# define function that takes orientation, direction-block tuple 
def new_direction (in_orientation, direction):
    global orientation

    match in_orientation:
        case 'n':
            orientation = 'e' if direction == 'R' else 'w'
        case 'e':
            orientation = 's' if direction == 'R' else 'n'
        case 's':
            orientation = 'w' if direction == 'R' else 'e'
        case 'w':
            orientation = 'n' if direction == 'R' else 's' 

    return orientation

# loop through directions, change orientation; loop trough block and add coordinates to seen and duplicates array; 
for direction, block in directions:
    orientation = new_direction(orientation, direction)
    
    for i in range(int(block)):
        x, y = coordinate
        operand, axis = operands[orientation]
        exec (axis + operand + "1")
        coordinate = (x,y)
        for coordinates in seen:
            if coordinate == coordinates:
                duplicates.append(coordinate)
        seen.append(coordinate)

x, y = duplicates[0]
print ("First duplicate is:", abs(x) + abs(y),  "blocks away.")
