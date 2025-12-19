#!/usr/bin/env perl

use strict;
# use warnings;

my $CYCLES = 10;

sub parse_num {
	my @str = @{$_[0]};
	my $start = $_[1];
	my $break_point = $_[2];

	# base case
	return "" if ($start >= $break_point);

	# print "\tindex: $start\tlength: $break_point\n";

	my $char_count = 1;

	for (my $i = $start + 1; $i < $break_point; $i++) {
		last unless ($str[$i] =~ $str[$start]);
		$char_count += 1 if ($str[$i] =~ $str[$start]);
		# print "checking $str[$i] against $str[$start]\n";
	}

	my $new_index = $start + $char_count;

	# print "$char_count" . "$str[$start]\n";
	return "$char_count" . "$str[$start]" . &parse_num(\@str, $new_index, $break_point);
}

sub generate_num {
	my @str = split('', $_[0]);
	my $size = scalar(@str);
	my $iteration = $_[1];
	my $break_point = $_[2];

	# base case
	return "" if ($iteration > $break_point);
	
	printf "%02d / %02d\n", $iteration, $break_point;
	my $new_str = &parse_num(\@str, 0, $size);

	return "$new_str\n" if ($iteration == $break_point);

	&generate_num($new_str, $iteration += 1, $break_point);

}

# read from stdin
while (<stdin>) {
	chomp($_);
	my $final_num =  &generate_num($_, 1, $CYCLES);
	# print $final_num;
	print "Final number is " . length($final_num) . " characters long\n";	
}
