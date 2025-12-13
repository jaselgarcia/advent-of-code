#! /usr/bin/env perl

use strict;
use warnings;
my $total_raw = 0;
my $total_decoded = 0;

# Find the differnce in lengthy between raw and decoded strings
while(<stdin>){
	chomp($_);
	my $raw_len = length($_);
	my $decoded_str = eval $_;
	my $decoded_len = length($decoded_str);
	$total_raw += $raw_len;
	$total_decoded += $decoded_len;
	# print "$raw_len\t$_\t$decoded_len\t$decoded_str\n";
}

my $diff = $total_raw - $total_decoded;
print "$total_raw raw - $total_decoded decoded = $diff\n";
