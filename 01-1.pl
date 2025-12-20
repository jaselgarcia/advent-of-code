#!/usr/bin/env perl

use strict;
use warnings;

my $sum = 0;

while (<stdin>) {
	chomp $_;
	my @num_array = split //, $_;

	for (my $i = 0; $i < scalar(@num_array); $i++) {
		if (defined($num_array[$i + 1])) {
			$sum += $num_array[$i] if $num_array[$i] == $num_array[$i + 1];
		}
	}

	my $last = pop(@num_array);
	my $first = shift(@num_array);
	$sum += $last == $first? $last : 0;	
}

print "$sum\n";
