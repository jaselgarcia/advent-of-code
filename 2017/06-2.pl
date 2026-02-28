#!/usr/bin/env perl

use strict; use warnings;

my @seen;
my $cycle = 0;

sub max {
	my @array = @{$_[0]};

	my @sorted = sort {$b <=> $a} @array;
	my $max_val = $sorted[0];

	for (my $i = 0; $i < scalar(@array); $i++) {
		return $i if $array[$i] == $max_val;
	}

}

sub balance {
	my @array = @{$_[0]};

	# find first index with maximum value
	my $idx = max(\@array);
	my $val = $array[$idx];
	$array[$idx] = 0;

	while ($val > 0 ) {
		$idx = $idx % scalar(@array);
		my $next = defined $array[$idx + 1] ? $idx + 1 : 0;

		$array[$next]++;
		$val--;
		$idx++;
	}

	return @array;
}


# save input into array
my @blocks = split /\s+/, <stdin>;

# continue calling balance until configuration we see a prev configuration
OUTER: while (1 == 1) {
	# printf "Current cycle: %s\n", $cycle;

	foreach my $combo (@seen) {
		# printf "\tComparing %s against %s\n", join('', @blocks),  $combo;
		last OUTER if join('', @blocks) eq $combo;
	}

	push @seen, join '', @blocks;

	@blocks = balance(\@blocks);
	# printf "New configuration: %s\n", join '', @blocks;
}

my $duplicate = join '', @blocks;
print "$duplicate\n";

while (1 == 1) {
	@blocks = balance(\@blocks);
	$cycle++;

	# printf "New configuration: %s\n", join '', @blocks;
	last if join ('', @blocks) eq $duplicate;
}

printf "Number of cycles after first duplicate: %s\n", $cycle;
