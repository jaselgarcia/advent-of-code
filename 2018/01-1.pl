#!/usr/bin/env -S perl -nl
# Couldn't easily achieve this brevity with use strict and warnings enabled.
# Edit: can only accomplish with strict and warnings with 'our' global variables.

use strict; use warnings;

our $total //= 0;

$total += $_;

END {
    print "$total";
}

