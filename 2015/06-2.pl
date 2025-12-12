#!usr/bin/env perl

use strict;
use warnings;

my $DIMENSION = 1000;
my $lights_array;
my $brightness = 0;

sub loop_lights {
	my ($verb, $row_start, $col_start, $row_end, $col_end) = @_;
	for (my $i = $row_start; $i <= $row_end; $i++) {
		for (my $j = $col_start; $j <= $col_end; $j++){
			my $current_light = $lights_array -> [$i] -> [$j];
			$current_light -= 1 if ($verb =~ /off/);
			$current_light += 1 if ($verb =~ /on/);
			$current_light += 2 if ($verb =~ /toggle/);
			$current_light = 0 if ($current_light < 0);
			$lights_array -> [$i] -> [$j] = $current_light;
		}
	}
}

sub count_lights {
	foreach my $element (@{$lights_array}) {
		foreach my $val (@{$element}){
			$brightness += $val;
			# print "$val\t"
		}
		# print "\n";
	}
}

# Need to create a multidimensional array of 1000 elements width and height
&loop_lights("off",0,0,$DIMENSION - 1,$DIMENSION - 1);

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

	# &count_lights;
	# $brightness = 0;
}

&count_lights;
print "$brightness\n";
