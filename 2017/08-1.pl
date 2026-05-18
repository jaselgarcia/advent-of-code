#!/usr/bin/env perl

use warnings;
use Data::Dumper;

my %ops = (
	inc => "+=",
	dec => "-="
);

my %vals;
my @sorted_keys;
my $max = 0;

while (<stdin>) {
	chomp $_;

	# b inc 5 if a > 1
	my ($var1, $op, $operand, $var2, $condition) = $_ =~ m/
	^(\S+)\s+(\S+)\s+(\S+)\s+if\s(\S+)(.*)$/x;

	$$var1 = 0 unless defined $$var1;
	$$var2 = 0 unless defined $$var2;

	eval "\$$var1 $ops{$op} $operand if \$$var2 $condition";
	# print "\$$var1 $ops{$op} $operand if \$$var2 $condition\n";

	$vals{$var1} = $$var1;
	$vals{$var2} = $$var2;

	@sorted_keys = sort { $vals{$b} <=> $vals{$a} } keys (%vals);
	# printf "%s = %s\n", $sorted_keys[0], ${$sorted_keys[0]};
	$max = ${$sorted_keys[0]} > $max ? ${$sorted_keys[0]} : $max;

	# printf "%s\n", $$var1;
	# printf "<%s> <%s> <%s> <%s> <%s>\n", $var1, $op, $operand, $condition, $var2;
}

print "Max value is $max\n";
die Dumper(\%vals);
