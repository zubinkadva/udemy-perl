#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub main() {
    my $text = "Loone 18 id dsf _dsg gdsfh";

    if($text =~ /(_)/g) {
        print $1;
    }
}

main();