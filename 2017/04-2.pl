#!/usr/bin/env perl

use strict;
use warnings;

my $count;
my @alpha_arr = ("a".."z");

sub numify_str {
	my @str_arr = @{$_[0]};
	my @num_arr;

	foreach my $str (@str_arr) {
		my $num = 0;
		foreach my $ltr (split('', $str)) {
			for (my $i = 0; $i < @alpha_arr; $i++) {
				$num += $i + 1 if $ltr eq $alpha_arr[$i];
			}
		}
		push (@num_arr, $num);
		# print "$num, ";
	}

	# print "\n";
	return @num_arr;
}

sub sort_str {
	my @str_arr = @{$_[0]};
	my @sorted_arr;

	foreach my $str (@str_arr) {
		my @unsorted = split '', $str;
		my $sorted_str = join '', sort @unsorted;
		# print "$sorted_str\n";
		push @sorted_arr, $sorted_str;
	}

	return @sorted_arr;

}

while (<stdin>) {
	chomp $_;
	my @pw_arr = split /\s+/, $_;
	my $idx = 1;
	my $valid = 1;

	# return new array with strings sorted	
	my @sorted_pw = &sort_str(\@pw_arr);

	foreach my $str (@sorted_pw) {
		for (my $i = $idx; $i < @sorted_pw; $i++) {
			$valid = 0 if $str eq $sorted_pw[$i];
		}
		$idx++;
	}

	$count += $valid;	
}

print "$count valid passphrases\n";
