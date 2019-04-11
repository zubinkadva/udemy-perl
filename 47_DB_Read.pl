#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use DBI;

sub main() {
    my $dbh = DBI->connect("dbi:SQLite:dbname=db.db");
    unless (defined($dbh)) {
        die("OOPS\n");
    }

    my $sth = $dbh->prepare('SELECT * FROM notes');
    unless (defined($sth)) {
        die("WHOOPS\n");
    }
    unless($sth->execute()) {
        die("WHOOPS\n");
    }

    open(OUTPUT, ">", "from_db.txt");
    while(my $row = $sth->fetchrow_hashref()) {
        my $name = $row->{"name"};
        my $heading = $row->{"heading"};
        my $body = $row->{"body"};
        my $from = $row->{"note_from"};
        my $to = $row->{"note_to"};
        print(OUTPUT "$name,$heading,$body,$from,$to\n");
    }
    $sth->finish();
    close(OUTPUT);
}

main();
