#!usr/bin/env perl

use strict;
use warnings;

my $lights_array;
my $count=0;

sub loop_lights {
	my ($verb, $row_start, $col_start, $row_end, $col_end) = @_;
	for (my $i = $row_start; $i <= $row_end; $i++) {
		for (my $j = $col_start; $j <= $col_end; $j++){
			$lights_array -> [$i] -> [$j] = 0 if ($verb =~ /off/);
			$lights_array -> [$i] -> [$j] = 1 if ($verb =~ /on/);
			if ($verb =~ /toggle/) {
				if ($lights_array -> [$i] -> [$j] == 0) {
					$lights_array -> [$i] -> [$j] = 1;
				} elsif ($lights_array -> [$i] -> [$j] == 1) {
					$lights_array -> [$i] -> [$j] = 0;
				}
			}
		}
	}
}

sub count_lights {
	foreach my $element (@{$lights_array}) {
		foreach my $val (@{$element}){
			$count++ if ($val == 1);
		}
	}
}

# Need to create a multidimensional array of 1000 elements width and height
&loop_lights("off",0,0,999,999);

# Parse instructions from stdin or file
while (<stdin>) {
	# Leave <verb> <start coord> <end coord> and split on whitespace after
	$_ =~ s/(turn |through )//g;
	my ($verb, $start, $end) = split(/\s+/, $_);		

	# Split coords on comma
	my ($row_start, $col_start) = split(/,/, $start);
	my ($row_end, $col_end) = split(/,/, $end);

	# print "$verb\t$start\t$end\n";
	&loop_lights($verb, $row_start, $col_start, $row_end, $col_end);
}

&count_lights;
print "$count\n";
