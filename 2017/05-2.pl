#!/usr/bin/env perl

use strict; 

my @instructions;
my $MAX_DEPTH = 50000;
my $RECUR = 1;

my $stack_depth = 0;
my @return_arr;
my $result;

while (<stdin>) {
	# Push all lines into array
	chomp;
	push (@instructions, $_);	
}

sub follow_instructions {
	# accept array ref, staring index and return if starting index undefined and current count
	my @arr = @{$_[0]};	
	my $idx = $_[1];
	my $count = $_[2];
    $stack_depth++;

    
    if ($stack_depth > $MAX_DEPTH) {
        my $max_count = ($count / $MAX_DEPTH);
        print  "$max_count time hitting max depth.\tcount: $count\tindex: $idx\n";
        $stack_depth = 0;
        my @return = ($count, $idx, @arr);
        return @return; 
    }

    unless (defined $arr[$idx]) {
        $RECUR = 0;
        my @return = ($count, $idx);
        $result = $count;
        return @return;
    }

	# for each instruction read, increment current value, resolve next index, and increment count
	my $next = $idx + $arr[$idx];
	$arr[$idx]+= $arr[$idx] < 3 ? 1 : -1;
	
    # printf "%04d -> %04d\n", $idx, $next; 
    # printf "%04d\n", $stack_depth;
	return &follow_instructions(\@arr, $next, ++$count);
}

# Recursively follow and increment instructions until reach undefined, start at first instruction
while ($RECUR) {

    my $outer_count = shift @return_arr;
    my $outer_idx = shift @return_arr;

    if (defined($outer_count)) {
        @return_arr = &follow_instructions(\@return_arr, $outer_idx, $outer_count);
    } else {
        @return_arr = &follow_instructions(\@instructions, 0, 0);
    }

    # printf "count: %d\tindex: %d\n", $outer_count, $outer_idx;
}

printf "result: %d\n", $result;
