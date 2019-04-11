#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper;

sub test1() {
    open(INPUT, "<", "main.csv") or die("OOPS");
    while (my $line = <INPUT>) {
        print("$line\n");
    }
    close(INPUT);
}

sub test2() {
    my @lines;
    open(INPUT, "<", "main.csv") or die("OOPS");
    my @headings = split(/\s*,\s*/, <INPUT>);
    # <INPUT>; # Skip header
    LINE:    while (my $line = <INPUT>) {
        chomp($line);                # Removes newline char
        $line =~ /\S+/ or next;      # Remove bank lines
        $line =~ s/^\s*|\s*$//g;     # Remove spaces at begin, end of line
        $line =~ s/approx.|\$|\?//g; # Remove 'approx.', '$', '?'
        # Split after removing un necessary spaces between values
        my @values = split(/\s*,\s*/, $line);
        if (@values < 3) {
            next;
        }
        foreach my $value (@values) {
            if (length($value) == 0) {
                next LINE;
            }
        }
        my %hash;
        foreach (my $i = 0; $i < @headings; $i++) {
            $hash{$headings[$i]} = $values[$i];
        }
        # my ($name, $payment, $date) = @values;
        # my %hash = (
        #     $headings[0] => $name,
        #     $headings[1] => $payment,
        #     $headings[2] => $date
        # );
        push(@lines, \%hash);
    }
    close(INPUT);
    my $total;
    foreach my $line (@lines) {
        $total += $line->{"Payment"};
    }
    print("Total: $total");
}

test2();