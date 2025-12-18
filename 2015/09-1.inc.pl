#! /usr/bin/env perl

use strict;
use warnings;

my %cities;
my $tree_depth;

# Recursively travel list until reach $num_cities
# Need to refactor to receive target city, hash to traverse
# Will recur on destination city until one doesn't exist
# May need to keep track of cities visited
sub travel_tree {
	my %tree = %{$_[0]};
	my $start = $_[1];
	my $break_point = $_[2];
	my $tree_depth = $_[3];

	# rescursion base condition
	if (($tree_depth > $break_point) || keys(%{$tree{$start}}) == 0) {
		return "";
	}

	print "\nbreak_point: $break_point, tree_depth: $tree_depth\n";

	 while (my ($next, $dist) = each(%{$tree{$start}})) {
		# return "$start -> $next: $dist\n";
		my $itinerary = "$start -> $next\t";
		return $itinerary . &travel_tree(\%tree, $next, $break_point, $tree_depth += 1) . "\n";
	}
}

while (<stdin>) {
	# Leave <start city> <dest city> <dist> and split on whitespace
	$_ =~ s/(to |= )//g;
	my ($start_city, $dest_city, $dist) = split(/\s+/,$_);

	# Create a list of each unique city that needs to be visited, save dest info in str
	$cities{$start_city} .= join(' ', $dest_city, $dist) . ' ';
	$cities{$dest_city} .= '';

	print "$start_city\t$dest_city\t$dist\n";
}

my $num_cities = scalar(keys(%cities));
my @list_cities = keys(%cities);
print "\nNumber of cities: $num_cities\n";

# Create multidimensional hash using $dests str as ref hash
while (my ($city, $dests) = each(%cities)) {
	my %curr_hash = split(/\s+/,$dests);
	$cities{$city} = \%curr_hash;
}

foreach my $start (@list_cities) {
	print "Starting in $start";
	print "\n" . &travel_tree(\%cities, $start, $num_cities, 1) . "\n";
 }
