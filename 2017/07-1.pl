#!/usr/bin/env perl

use strict; use warnings;
use Data::Dumper;

my (%weights, %tree, %found);

while (<stdin>) {
	chomp (my $line = $_);
    
    # grab variables from input line following format below
    # fwft (72) -> ktlj, cntj, xhth
	my ($name, $weight, $branch) = m/^([^\s]*)\s*\(([0-9]*)\)(?:.*\->\s*(.*))*$/;

	$weights{$name} = $weight;

	if (defined $branch) {
		my @arr = split /\s*,\s*/, $branch;
		$tree{$name} = \@arr;
	}
}	

# search for each tree base in every branch
foreach my $name (keys %tree) {
	while (my($base,$branch) = each %tree) {
		$found{$name}++ if grep { $_ eq $name } @{$branch};
	}
}

foreach my $name (keys %tree) {
	print "Bottom of the tree is $name\n" unless grep { $_ eq $name } keys(%found);
}

printf "%s\n%s\n", "Nested tree hash:", Dumper(\%tree);
printf "%s\n%s\n", "Weights array:", Dumper(\%weights);
printf "%s\n%s\n", "Names found in tree:", Dumper(\%found);
