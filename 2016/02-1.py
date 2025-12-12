#!/usr/bin/env python3

from sys import stdin, stdout

numpad = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
currentpos = (1, 1) 
directions = [direction.strip() for direction in stdin.readlines()]
orientations = {'U': (-1, 0), 'D': (1, 0), 'L': (0, -1), 'R': (0, 1)}
code = ""

# if dest pos < 0 || > len array item, don't move
def check_dest(y0, x0, y, x):
    if (y0 + y < 0 or y0 + y > len(numpad) - 1) or (x0 + x < 0 or x0 + x > len(numpad[y0]) - 1):
        return False
    return True

for direction in directions:
    for orientation in direction: 
        y0, x0 = currentpos
        y, x = orientations[orientation]
        if check_dest(y0, x0, y, x):
            currentpos = (y0 + y, x0 + x) 
#            print (orientation, currentpos)
    code += str((numpad[currentpos[0]][currentpos[1]]))

print ("Code is:", code)
