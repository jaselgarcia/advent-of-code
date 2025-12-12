BEGIN{FS = ""; n = 0}
/(ab|cd|pq|xy)/ {skip; x = x + 1}
/.*[aeiou].*[aeiou].*[aeiou].*/ && !/(ab|cd|pq|xy)/ {
    for (i = 1; i <= NF; i++) {
        if ($i == $(i + 1)) {
            n = n + 1;
            break;
        }
    }
}
END {print n, x}

