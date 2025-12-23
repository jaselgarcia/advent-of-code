#!/usr/bin/env perl

use strict;
use warnings;

my $count;

while (<stdin>) {
	chomp $_;
	my @pw_arr = split /\s+/, $_;
	my $idx = 1;
	my $valid = 1;

	foreach my $word (@pw_arr) {
		for (my $i = $idx; $i < scalar @pw_arr; $i++) {
			$valid = 0 if $word eq $pw_arr[$i];
		}
		$idx++;
	}

	$count += $valid;	
}

print "$count\n";
