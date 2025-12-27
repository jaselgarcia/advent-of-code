#!/usr/bin/env perl

use strict; use warnings;

my @instructions;

while (<stdin>) {
	# Push all lines into array
	chomp;
	push (@instructions, $_);	
}

sub follow_instructions {
	# accept array ref, staring index and return if starting index undefined and current count
	my @arr = @{$_[0]};	
	my $idx = $_[1];
	my $count = $_[2];

	return $count unless defined $arr[$idx];

	# for each instruction read, increment current value, resolve next index, and increment count
	my $next = $idx + $arr[$idx];
	$arr[$idx]++;
	
	printf "%04d -> %04d\n", $idx, $next; 
	return &follow_instructions(\@arr, $next, ++$count);
}

# Recursively follow and increment instructions until reach undefined, start at first instruction
printf "%d\n", &follow_instructions(\@instructions, 0, 0);
