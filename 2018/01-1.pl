#!/usr/bin/env -S perl -nl
# Couldn't easily achieve this brevity with use strict and warnings enabled.

$total += $_;

END {
    print "$total";
}

