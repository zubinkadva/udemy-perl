#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper;

sub main() {
    my @arr = ("A", "B", "C");
    print(Dumper(@arr) . "\n");
    push(@arr, "D");
    print(Dumper(@arr) . "\n");

    my %hash = (
        "key1" => "value1",
        "key2" => "value2"
    );
    print(Dumper(%hash) . "\n");
    # push(%hash, (
    #     "key3" => "value3"
    # ));
    # print(Dumper(%hash) . "\n");

    my $arr = \@arr;
    print(Dumper($arr) . "\n");

    my $hash = \%hash;
    print(Dumper($hash));
}

main();