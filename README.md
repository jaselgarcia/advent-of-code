# Advent of Code notes

Going through the Advent of code puzzles to gain practice in various programming langauges
and will use this `README` to compile notes on things I've discovered along the way.
Might be best to break this up by programming language for now.
May revisit document structure in the future.

## Perl

**2015, day 08**:
needed to encode/decode strings - good use case for `quotemeta` and `eval`functions

**2015, day 09**:
need to develop tree structure and traversal methods - first signifcant challenge
- Exploring mutlidimensional hash arrays and recursion
- First encounter with perl's quirky method of iterating over hash. Poses challenge when recursviely traveling mulitidimensional hash with each.

**2016, day 04**:
extensive use of array and hash methods, plus extra practicw with perl regex matching
- Couldn't find a way to interpolate string in `tr` regex so resorted to rebuilding strings using various combinations of shift, pop, etc.
- Part 1 found good use cases for using perl's sorting algorithims on hash and array structures. Also took advantage of hash's ability to count occurence of characters in string.

