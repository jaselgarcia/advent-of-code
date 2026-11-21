#!/usr/bin/env -S perl -nl
# Find first repeated resulting frequency.
#
# Naive approach dictates grepping for an identical existing frequency in a list,
# exiting if frequency exists or pushing frequency if not.
# Checking for definiton of variable best way to keep use warnings and strict.
# Assigning with // syntax could save characters
#
# Need to loop over list multiple times.
# While true and exiting on successful grep seems simplest.

unless (defined $total) { 
    $total = 0;
    push @previous, $total;
}

$total += $_;

# printf "%s\n", join ',', @previous;

( grep { $_  == $total } @previous ) ?
die $total :
push @previous, $total;
