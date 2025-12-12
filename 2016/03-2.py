#!/usr/bin/env python3

from sys import stdin, stdout

input_data = [dimension.strip().split() for dimension in stdin.readlines()]
triangles = 0
shapes = []

# transpose input data and construct new list
for i in range(0, len(input_data), 3):
    for j in range(0, len(input_data[i])):
            shapes.append([input_data[i][j], input_data[i+1][j], input_data[i+2][j]])

def check_sums(shape):
    d0, d1, d2 = shape 
    if (int(d0) + int(d1) <= int(d2)) or (int(d1) + int(d2) <= int(d0)) or  (int(d0) + int(d2) <= int(d1)):
        return False
    return True

for shape in shapes:
    if check_sums(shape):
        triangles += 1

print (triangles)
