#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Getopt::Std;
use Data::Dumper;

sub main() {
    routine(1, 2);
    my %opts;
    getopts("rd:", \%opts);
    if(!check_usage(\%opts)) {
        usage();
    }
    my $dir = $opts{"d"};
}

sub routine() {
    my $one = shift();
    my $two = shift();
    # my($one, $two) = @_;
    print("$one $two\n");
}

sub check_usage() {
    # my %opts = @_;
    my $opts = shift();
    my $aa = $opts->{"r"};
    my $bb = $opts->{"d"};
    unless(defined($aa) and defined($bb)) {
        return 0;
    }
    return 1;
}

sub usage() {
    print <<USAGE;
OOPS
USAGE
    exit();
}

main();
