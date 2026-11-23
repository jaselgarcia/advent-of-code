#!/usr/bin/env -S perl -nl
#
# Increment multidimensional array according to input,
# and count of all values greater than 1.
#
# Sample input:
# #123  @   3,  2:  5x  4
# id        x   y   w   h    
#
# Good opportunity to practice assigning to array slices.

use strict; use warnings;
use Data::Dumper;

our $aoa unless defined $aoa;

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

# Can this be expressed more succinctly?
for (@{ $aoa }[$y .. $y + $height - 1]) {
    for (@{ $_ }[$x .. $x + $width - 1]) {
        $_++;
    }
}

END {
    my $sum;

    # Can this be expressed more succinctly?
    for my $row (@{ $aoa }) {
        $sum += grep { $_ > 1 if defined $_ } @{ $row };
    }

    print "Overlapping squares: $sum";
}
