#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use File::Copy;

sub main() {
    unless (copy('scratchfile', 'Welcome/scratchfile')) {
        die("OOPS\n");
    }
    unless (move("Welcome/scratchfile", "scratchfile2")) {
        die("OOPS\n");
    }
    unless (unlink("scratchfile2")) {
        die("OOPS\n");
    }
    print(`dir`);
}

main();
