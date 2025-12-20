#!/usr/bin/env perl

use strict;
use warnings;

my $sum = 0;

while (<stdin>) {
	chomp $_;
	my @num_array = split //, $_;
	my @first_half = splice(@num_array, 0, scalar(@num_array) / 2);
	my @second_half = @num_array; 

	for (my $i = 0; $i < scalar(@first_half); $i++) {
		$sum += $first_half[$i] if $first_half[$i] == $second_half[$i];
		$sum += $second_half[$i] if $first_half[$i] == $second_half[$i];
	}
}

print "$sum\n";
