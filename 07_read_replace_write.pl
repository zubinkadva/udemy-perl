#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $file = "output.txt";
my $content = "This is sample content";

sub write_to_file() {
    open(OUTPUT, ">", $file) or die("OOPS\n");
    print(OUTPUT $content);
    close(OUTPUT);
}

sub read_from_file() {
    open(INPUT, "<", $file) or die("OOPS\n");
    while(my $line = <INPUT>) {
        print($line);
    }
    close(INPUT);
}

sub replace_in_file() {
    open(INPUT, "<", $file) or die("OOPS\n");
    open(OUTPUT, ">", "new_file.txt") or die("OOPS\n");
    while(my $line = <INPUT>) {
        $line =~ s/is/WWWW/ig;
        print(OUTPUT $line);
    }
    close(INPUT);
    close(OUTPUT);
}

write_to_file();
read_from_file();
replace_in_file();