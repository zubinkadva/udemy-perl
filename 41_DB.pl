#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use DBI;
use XML::Simple;
use Data::Dumper;

sub main() {
    undef $/;
    open(INPUT, "dir/first.xml") or die("OOPS\n");
    my $content = <INPUT>;
    close(INPUT);
    my $parser = XML::Simple->new;
    my $dom = $parser->XMLin($content, ForceArray => 1);
    my @data;

    foreach my $note (@{$dom->{"note"}}) {
        my (@people, @stuff);
        foreach my $person (@{$note->{"people"}}) {
            push(@people, {
                "from" => $person->{"from"}->[0],
                "to"   => $person->{"to"}->[0]
            });
        }
        foreach my $stuff (@{$note->{"stuff"}}) {
            push(@stuff, {
                "heading" => $stuff->{"heading"}->[0],
                "body"    => $stuff->{"body"}->[0]
            });
        }
        push(@data, {
            "name"   => $note->{"name"}->[0],
            "people" => \@people,
            "stuff"  => \@stuff
        });
    }

    my $dbh = DBI->connect("DBI:SQLite:dbname=db.db");
    unless (defined($dbh)) {
        die("OOPS\n");
    }
    my $sth = $dbh->prepare('INSERT INTO notes
        (name, heading, body, note_from, note_to) VALUES (?, ?, ?, ?, ?)');
    unless (defined($sth)) {
        die("OOPS\n");
    }
    foreach my $data (@data) {
        my $name = $data->{"name"};
        my ($from, $to, $heading, $body);
        foreach my $person(@{$data->{"people"}}) {
            $from = $person->{"from"};
            $to = $person->{"to"};
        }
        foreach my $stuff(@{$data->{"stuff"}}) {
            $heading = $stuff->{"heading"};
            $body = $stuff->{"body"};
        }
        unless ($sth->execute($name, $heading, $body, $from, $to)) {
            die("WHOOPS\n");
        }
    }
    $sth->finish();
}

main();
