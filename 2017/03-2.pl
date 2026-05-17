#!/usr/bin/env perl

use strict; use warnings;
use Data::Dumper;

my $x = my $y = 5;

# Initialize arrays
my $grid->[$y]->[$x] = 1;

sub sum_adjacent {
	my ($a, $b) = @_;
	my $sum = 0;
	
	for (my $i = -1; $i < 2; $i++) {
		for (my $j = -1; $j < 2; $j++) {
			my $value = $grid->[$y + $i]->[$x + $j];
			$sum += $value if defined $value; 
		}
	}

	return $sum;
}

	

for (my $i = 0; $x > 0 && $y > 0; $i++) {
	my $step = $i % 2 == 0 ? 1 : -1;

	for (my $j = $i + 1; $j > 0; $j--) {
		$x += $step;
		$grid->[$y]->[$x] = sum_adjacent($x, $y);
	}

	for (my $j = $i + 1; $j > 0; $j--) {
		$y -= $step;
		$grid->[$y]->[$x] = sum_adjacent($x, $y);
	}
}

foreach my $row (@{$grid}) {
	@{$row} = map {$_ // '0'} @{$row};
	printf "%s\n", join ",", @{$row};
}

# die Dumper($grid);
