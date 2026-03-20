#!/usr/bin/env perl

use strict; use warnings;

my $num = $ARGV[0];
my $sqr = sqrt($num);
my $lvl;
my @arr;

if (int($sqr) == $sqr) {
	$lvl = $num % 2 == 0 ? int($sqr) + 1 : int($sqr);
} else {
	$lvl = int($sqr) % 2 == 0 ? int($sqr) + 1 : int($sqr) + 2;
}

my $min = ($lvl - 1) / 2;

printf "Square root of %s is %f in level %d\n", $num, $sqr, $lvl;
printf "Need to traverse %d to %d\n", ($lvl - 2) ** 2 + 1, $lvl ** 2;
printf "Min number of steps is %d\n", $min;

for (my $i = $lvl ** 2; $i > ($lvl - 2) ** 2; $i-- ) {
	push @arr, $i;
}

for (my $i = 0; $i < scalar(@arr); $i++ ) {
	my $steps = ($lvl - 1) - $i % ($lvl - 1);
	$steps = $lvl - 1 - $steps if $steps < $min;
	print "$num is $steps steps away\n" if $arr[$i] == $num;
}
