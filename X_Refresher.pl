#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper;

#####
my @arr = ("A", "B", "C");
print($#arr + 1);
print("\n");

#####
my $string = "APerlAReplAFunction";
my $counter = ($string =~ tr/A//);
print "There are $counter As in the given string\n";
print $string;

#####
sub uniqueentr {
    return keys(%{{ map ({$_ => 1} @_) }});
}
my @array = ("perl", "php", "perl", "asp");
print join(" ", @array), "\n";
print join(" ", uniqueentr(@array)), "\n";

#####
my $input = <STDIN>;
my @numbers = split(" ", $input);
my $sum;
foreach my $num (@numbers) {
    $sum += $num;
}
print("SUM: $sum; AVG: " . $sum / $#numbers);

