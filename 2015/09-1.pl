#! /usr/bin/env perl

use strict;
use warnings;
my %cities;
my $tree_depth;

# Recursively travel list until reach $num_cities
# Need to refactor to recieve target city, hash to traverse
# Will recur on destination city until one doesn't exist
# May need to keep track of cities visited
sub travel_tree {
	my %tree = %{$_[0]};
	my $break_point = $_[1];
	my $tree_depth = $_[2];
	
	print "\nbreak_point: $break_point, tree_depth: $tree_depth\n";
	return if ($tree_depth > $break_point);


	while (my ($city, $dests) = each(%tree)) {
		print "processing $city destinations\n";	
		my $ref_type = ref($dests);
		next unless ($ref_type =~ /HASH/);
		&travel_tree (\%{$dests}, $break_point, $tree_depth++);
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
print "\nNumber of cities: $num_cities\n";

# Create multidimensional hash using $dests str as ref hash
while (my ($city, $dests) = each(%cities)) {
	my %curr_hash = split(/\s+/,$dests);
	$cities{$city} = \%curr_hash;
}

foreach my $city (keys(%cities)){
	print "\nStarting in $city:\n";
	&travel_tree(\%cities, $num_cities, 1);
}

# Data dump/debug
# print "\n";
# while (my ($city, $dests) = each(%cities)) {
# print "$city:\n";
# while (my ($dest, $dist) = each($dests)) {
# print "\t$dest => $dist\n";
# }
# }
