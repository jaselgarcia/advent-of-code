#!/usr/bin/env perl

use strict; use warnings;

my (%weights, %tree, %found);

while (<stdin>) {
	chomp (my $line = $_);
	my ($name, $weight, $branch) = m/^([^\s]*)\s*\(([0-9]*)\)(?:.*\->\s*(.*))*$/;

	$weights{$name} = $weight;

	if (defined $branch) {
		my @arr = split /\s*,\s*/, $branch;
		$tree{$name} = \@arr;
	}
}	

foreach my $name (keys %tree) {
	while ( my($base,$branch) = each %tree) {
		$found{$name}++ if grep { $_ eq $name } @{$branch};
	}
}

foreach my $name (keys %tree) {
	print "Bottom of the tree is $name\n" unless grep { $_ eq $name } keys(%found);
}
