#!/usr/bin/env perl

use strict;
use warnings;

my %letters;
my $sum = 0;

# parse std in
while (<stdin>) {
	$_ =~ m/([\D]+)([\d]+)\[([\D]+)\]/;

	# must be a better way to coerce code into arr
	my $code = $1;
	$code =~ tr/-//d;
	my @code_arr = split(//,$code);
       	my $id = $2;
	my $checksum = $3;
	
	# print "$code\t$id\t$checksum\n";	

	# count letter occurence with hash
	undef %letters;
	foreach my $ltr (@code_arr) {
		$letters{$ltr} += 1;
	}

	# print "Unsort:";
	# while (my($ltr, $count) = each(%letters)) {
		# print "\t$ltr: $count";
	# }

	# sort by alpha then value
	my @sorted_letters = sort {$a cmp $b} keys(%letters);
	@sorted_letters = sort {$letters{$b} <=> $letters{$a}} @sorted_letters;

	# print "\nSorted:";
	# foreach my $ltr (@sorted_letters) {
	#	print "\t$ltr";
	# }

	my $value = join ("", splice(@sorted_letters, 0, 5));
	if ($value =~ $checksum) {
		# print "\nValid";
		$sum += $id;
	}

	# print "\n\n";
}

print "Sum of valid ids: $sum\n";

