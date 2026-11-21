#!/usr/bin/env -S perl -nl
#
# Count frequency of letters for each line of input.
# Track whether each line has excatly two or three occurences of letters.

use strict; use warnings;

our $twos //= 0;
our $threes //= 0;
my %freq;

map { $freq{$_}++ } split //, $_;

$twos++ if (grep /2/, values %freq);
$threes++ if (grep /3/, values %freq);

END {
    print $twos * $threes;
}
