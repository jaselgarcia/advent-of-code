#!/usr/bin/env perl

use strict;
use warnings;

my @transposed;

sub top_char {
	my $str = $_[0];
	my %char_count;
	my @top_chars;

	# count character freq with hash
	foreach my $char (split(//, $str)) {
		$char_count{$char} += 1;
	}       

	@top_chars = sort {$char_count{$b} <=> $char_count{$a}} keys(%char_count);

	return pop(@top_chars);
}

while (<stdin>) {
	chomp $_;
	my $i = 0;

	#transpose strings and push to array
	foreach my $char (split(//, $_)) {
		$transposed[$i] .= $char;
		$i++;
	}
}

foreach my $str (@transposed) {
	printf ("%s", &top_char($str));
} 

print "\n";
