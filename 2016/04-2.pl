#!/usr/bin/env perl

use strict;
use warnings;

my %letters;
my $sum = 0;

sub debug {
	my @code_arr = @{$_[0]};
	my @sorted_letters = @{$_[1]};

	print "Code:";
	foreach my $ltr (@code_arr){
		print"$ltr";
	}
	
	print "\n";
	
	print "Unsort:";
	while (my($ltr, $count) = each(%letters)) {
		print "\t$ltr: $count";
	}

	print "\nSorted:";
	foreach my $ltr (@sorted_letters) {
		print "\t$ltr";
	}

	print "\n";
}

sub decode {
	my @alpha = ('a'..'z');
	my $alpha_regex = join('', @alpha);
	my $code = $_[0];
	my $rotations = $_[1];
	my @cipher;
	my $decoded_str;

	my $shift = $rotations > scalar(@alpha) ? $rotations % scalar(@alpha): $rotations;
	
	# shift letters to create cipher
	# print "Shift by $shift\n";
	for (my $i = 0; $i < $shift; $i++) {
		push(@cipher, shift(@alpha));
	}
	unshift(@cipher, @alpha);

	# print "Checking $code:\n";
	foreach my $code_char (split(//, $code)) {
		my $i = 0;
		foreach my $search_char (split(//, $alpha_regex)) { 
			# print "Checking $code_char against $search_char\n";
			# print "\t$code_char matches index $i in \$alpha_regex\n" if $code_char eq $search_char;
			$decoded_str .= $cipher[$i] if $code_char eq $search_char;
			$i++;
		}
		$decoded_str .= ' ' if ($code_char =~ /\-/);
	}

	return $decoded_str;
}
 
sub check_code {
	my $code = ${$_[0]};
	$code =~ tr/-//d;
	my @code_arr = split(//, $code);
	my $id = $_[1];
	my $checksum = $_[2];

	# count letter occurence with hash
	undef %letters;
	foreach my $ltr (@code_arr) {
		$letters{$ltr} += 1;
	}

	# sort by alpha then value
	my @sorted_letters = sort {$a cmp $b} keys(%letters);
	@sorted_letters = sort {$letters{$b} <=> $letters{$a}} @sorted_letters;

	# &debug(\@code_arr, \@sorted_letters);

	my $value = join ("", splice(@sorted_letters, 0, 5));
	if ($value =~ $checksum) {
		# print "\nValid";
		return $id;
	}
}

# parse std in
while (<stdin>) {
	# capture values with regex
	$_ =~ m/([\D]+)([\d]+)\[([\D]+)\]/;
	my $code = $1;
       	my $id = $2;
	my $checksum = $3;
	
	printf ("%04d:\t%s\n", $id, &decode($code, $id)) if &check_code(\$code, $id, $checksum);
}

# print "Sum of valid ids: $sum\n";

