#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub test1() {
    my $msg = "Hello World!";
    print($msg);
}

sub test2() {
    my @emails = ('a@a.com', 'b', 'c@c', '@d', '@e.eu');
    foreach my $email(@emails) {
        if($email =~ /\w+\@\w+\.\w+/) {
            print("$email\n");
        }
    }
}

sub test3() {
    my $text = "The code for this device is SP46417.";
    if($text =~ /(\w\w\d{4})/) {
        print($1);
    } else {
        print("Not found");
    }
}

sub test4() {
    my $text = "The code for this device is SP46417. More text here";
    if($text =~ /\sis\s(.+?)\./) {
        print($1);
    } else {
        print("Not found");
    }
}

sub test5() {
    my $text = "The code for this device is SP465565. More text here";
    if($text =~ /([aA-zZ]{2}\d{2,6})/) {
        print($1);
    } else {
        print("Not found");
    }
}

test5();