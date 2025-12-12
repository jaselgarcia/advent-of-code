#!/usr/bin/env python3

from sys import stdin, stdout

shapes = [dimension.strip().split() for dimension in stdin.readlines()]
triangles = 0

# take index of shape, iterate through the array testing sums vs remainders

def check_sums(shape):
    d0, d1, d2 = shape 
    if (int(d0) + int(d1) <= int(d2)) or (int(d1) + int(d2) <= int(d0)) or  (int(d0) + int(d2) <= int(d1)):
        return False

    return True

for shape in shapes:
    if check_sums(shape):
        triangles += 1

print (triangles)
