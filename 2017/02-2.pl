#!/usr/bin/env perl

use strict;
use warnings;

my $checksum = 0;

sub find_quotient {
	my @num_arr = @{$_[0]};
	@num_arr = sort{$b <=> $a} (@num_arr);
	
	foreach my $num (@num_arr) {
		for (my $i = scalar(@num_arr) - 1; $i > 0; $i--) {
			 my $result = $num % $num_arr[$i] == 0 && $num != $num_arr[$i] ? $num / $num_arr[$i] : undef;
			 # print "$num / $num_arr[$i] = $result\n" if defined($result);
			 return $result if defined($result);
		}
	}
}

while (<stdin>) {
	chomp $_;
	my @num_arr = split(/\s+/, $_);

	# &find_quotient(\@num_arr);
	$checksum += &find_quotient(\@num_arr);
}

print "$checksum\n";
