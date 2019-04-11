#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';


sub main() {
    my $file = "sample.txt";

    open(INPUT, $file) or die("OOPS\n");

    while(my $line = <INPUT>) {
        if($line =~ /ine/ ) {
            print("OK\n");
        }
    }

    close(INPUT);
}

main();