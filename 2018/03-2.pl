#!/usr/bin/env -S perl -nl
#
# Increment multidimensional array according to input,
# caching each line of input to later check if
# record describes slice of array without values greater than 1.
#
# Sample input:
# #123  @   3,  2:  5x  4
# id        x   y   w   h    

use v5.12; use warnings;
use Data::Dumper;

our $aoa unless defined $aoa;
our @cache unless scalar @cache > 0;

my (
    $id,
    $x,
    $y,
    $width,
    $height
) = /
    \#(\d+)\s@\s
    (\d+),
    (\d+):\s
    (\d+)x
    (\d+)  
/x;

$cache[$id - 1] = {
    x       => $x,
    y       => $y,
    width   => $width,
    height  => $height,
    id      => $id
};

# Can this be expressed more succinctly?
for (@{ $aoa }[$y .. $y + $height - 1]) {
    for (@{ $_ }[$x .. $x + $width - 1]) {
        $_++;
    }
}

END {
    OUTER:
    foreach my $shape (@cache) {
        foreach my $row (@{ $aoa }[$shape->{y} .. $shape->{y} + $shape->{height} - 1]) {
            next OUTER if grep {$_ > 1 } 
            (@{ $row }[$shape->{x} .. $shape->{x} + $shape->{width} - 1]);
        }

       say $shape->{id} and last;
    }
}
