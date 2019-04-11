#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Data::Dumper;

sub main() {
    my %hash = (
        0 => 'ZERO',
        1 => 'ONE',
        2 => 'TWO'
    );
    print('$hash{0}: ' . $hash{0});
    print("\nKeys: " . keys(%hash) . "\n");
    while (my ($key, $val) = each(%hash)) {
        print("$key: $val\n");
    }
}

main();

