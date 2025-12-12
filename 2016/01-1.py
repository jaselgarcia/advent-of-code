#!/usr/bin/env python3

from sys import stdin, stdout

# declare global variables to track orientation and blocks in each cardinal direction
orientation = 'n'
blocks = {'n': 0, 'e': 0, 's': 0, 'w': 0}
directions = [(direction.strip()[0], direction.strip()[1:]) for direction in stdin.read().split(",")]

# define function that takes orientation, direction tuple: three arguments
def new_direction(in_orientation, direction):
    
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

# loop over directions and accumulate block metrics
for direction, block in directions:

    print (orientation, direction, block)
    blocks[new_direction (orientation, direction)] += int(block)
    print (blocks) 
    
print ("Blocks travelled: ", abs(blocks['n'] - blocks['s']) + abs(blocks['e'] - blocks['w'])) 
