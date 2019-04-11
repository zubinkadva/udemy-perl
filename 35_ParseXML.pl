; #!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper;
use Getopt::Std;
use XML::Simple;

sub main() {
    my %opts;
    getopts("rd:", \%opts);
    if (!usage(\%opts)) {
        print("OOPS");
        exit();
    }
    my $dir = $opts{"d"};
    my @files = get_files($dir);
    process_files(\@files, $dir);
}

sub process_files() {
    my ($files, $dir) = @_;
    foreach my $file (@{$files}) {
        my @data = process_file($file, $dir);
    }
}

sub process_file() {
    my ($file, $dir) = @_;
    open(INPUT, "$dir/$file") or die("OOPSEE\n");
    # $/ = "</note>";

    undef $/;
    my $content = <INPUT>;

    while (my $chunk = <INPUT>) {
        my ($note_to) = $chunk =~ /<to>(.+?)<\/to>/i;
        unless (defined($note_to)) {
            next ();
        }
        print("$note_to\n");
    }
    close(INPUT);

    my $parser = XML::Simple->new;
    my $dom = $parser->XMLin($content, ForceArray => 1);
    my @notes = @{$dom->{"note"}};
    my @data_structure;

    foreach my $note (@notes) {
        my (@people, @stuff);
        my $name = $note->{"name"}->[0];

        foreach my $person (@{$note->{"people"}}) {
            push(@people, {
                "from" => $person->{"from"}->[0],
                "to"   => $person->{"to"}->[0]
            });
        }
        foreach my $data (@{$note->{"stuff"}}) {
            push(@stuff, {
                "heading" => $data->{"heading"}->[0],
                "body"    => $data->{"body"}->[0]
            });
        }

        push(@data_structure, {
            "name"   => $name,
            "people" => \@people,
            "stuff"  => \@stuff
        });
    }

    return \@data_structure;
}

sub get_files() {
    my $dir = shift();
    unless (opendir(INPUT, $dir)) {
        die("WHOOPS\n");
    }
    my @files = readdir(INPUT);
    closedir(INPUT);
    @files = grep (/\.xml$/i, @files);
    return @files;
}

sub usage() {
    my $opts = shift();
    unless (defined($opts->{"r"}) and defined($opts->{"d"})) {
        return 0;
    }
    return 1;
}

main();
