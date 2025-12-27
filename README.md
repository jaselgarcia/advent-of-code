# Advent of Code notes

Going through the Advent of code puzzles to gain practice in various programming languages
and will use this `README` to compile notes on things I've discovered along the way.
Might be best to break this up by programming language for now.
May revisit document structure in the future.

## Perl

**2015, day 08**:
needed to encode/decode strings - good use case for `quotemeta` and `eval`functions

**2015, day 09**:
need to develop tree structure and traversal methods - first significant challenge
- Exploring multidimensional hash arrays and recursion
- First encounter with Perl's quirky method of iterating over hash. Poses challenge when recursively traveling multidimensional hash with each.

**2016, day 04**:
extensive use of array and hash methods, plus extra practice with Perl regex matching
- Couldn't find a way to interpolate string in `tr` regex so resorted to rebuilding strings using various combinations of shift, pop, etc.
- Part 1 found good use cases for using Perl's sorting algorithms on hash and array structures. Also took advantage of hash's ability to count occurrence of characters in string.

