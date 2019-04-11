#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper;

sub main() {
    open(INPUT, "<", "test.csv") or die("OOPS");
    my @lines;
    LINE:
    while (my $line = <INPUT>) {
        chomp($line);
        $line =~ s/^\s*|\s*$//g; # Clean spaces at begin/end of line
        $line =~ s/\?|approx\.|\$//g; # Clean '?', 'approx.', '$'
        $line =~ /\S+/ or next;   # Proceed only if not empty line
        my @vals = split(/\s*,\s*/, $line);
        # Check if valid 3 column line
        if (@vals < 3) {
            print("OOPS: $line\n");
            next;
        }
        # Loop through each value and check if empty value
        foreach my $val (@vals) {
            if ($val eq '') {
                print("OOPS VAL\n");
                next LINE;
            }
        }
        my ($aa, $bb, $cc) = @vals;
        my %hash = ("a" => $aa, "b" => $bb, "c" => $cc);
        push(@lines, \%hash);
    }
    close(INPUT);

    print(Dumper(@lines));
}

main();
