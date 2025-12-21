#!/usr/bin/env perl

use strict;
use warnings;

my $checksum = 0;

sub find_diff {
	my @num_arr = @{$_[0]};
	@num_arr = sort {$a <=> $b} (@num_arr);
	
	return pop(@num_arr) - shift (@num_arr);

}

while (<stdin>) {
	chomp $_;
	my @num_arr = split(/\s+/, $_);

	$checksum += &find_diff(\@num_arr);
}

print "$checksum\n";
