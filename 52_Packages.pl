#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Welcome::Greeting qw(greet);

sub main() {
    greet();
}

main();