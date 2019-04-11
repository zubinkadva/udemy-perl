#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub main() {
    my $file = "sample.txt";
    open(INPUT, $file) or die("OOPS\n");
    while(my $line = <INPUT>) {
        if($line =~ /(L..e)( th)/g ) {
            print("Group 1: '$1'; Group 2: '$2'");
        }
    }
    close(INPUT);
}

main();