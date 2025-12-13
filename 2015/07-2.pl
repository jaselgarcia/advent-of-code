#! /usr/bin/env perl

use strict;
use warnings;
my $total_raw = 0;
my $total_encoded = 0;

# Find the differnce in length between raw and encoded strings
while(<stdin>){
	chomp($_);
	my $raw_len = length($_);
	my $encoded_str = '"' . quotemeta($_) . '"';
	my $encoded_len = length($encoded_str);
	$total_raw += $raw_len;
	$total_encoded += $encoded_len;
	# print "$raw_len\t$_\t$encoded_len\t$encoded_str\n";
}

my $diff = $total_encoded - $total_raw ;
print "$total_encoded encoded - $total_raw raw = $diff\n";
