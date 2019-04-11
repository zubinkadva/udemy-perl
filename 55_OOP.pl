#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Welcome::Person;

sub main() {
    my $person = Welcome::Person->new("AAAAA", 45);
    $person->greet("BBBBBB");
}

main();