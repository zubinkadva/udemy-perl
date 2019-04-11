#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper;

sub main() {
    my $input = 'test.csv';
    unless (open(INPUT, "<", $input)) {
        die("\n");
    }
    <INPUT>; # Discard first header line
    while (my $line = <INPUT>) {
        chomp($line);
        my @arr = split(",", $line);
        my $joined = join("|", @arr);
        print($joined);
    }
    close(INPUT);
}

sub dumper() {
    open(INPUT, "test.csv");
    while (my $line = <INPUT>) {
        chomp($line);
        my @arr = split(/\s*,\s*/, $line);
        print(Dumper(@arr));
    }
}

sub push_me() {
    open(INPUT, "test.csv");
    my @lines;
    while (my $line = <INPUT>) {
        chomp($line);
        push(@lines, $line);
    }
    print(Dumper(@lines));
    print("Lines: " . ($#lines + 1));
}


sub arr_arr() {
    open(INPUT, "test.csv");
    my @lines;
    while (my $line = <INPUT>) {
        chomp($line);
        my @line_arr = split(/\s*,\s*/, $line);
        push(@lines, \@line_arr);
    }
    print(Dumper(@lines));
    print($lines[0]->[0]); # Array de referencing
}

arr_arr();
