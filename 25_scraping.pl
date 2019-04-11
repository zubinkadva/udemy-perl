#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use LWP::Simple;
use Data::Dumper;

sub main() {
    my $content = get("https://www.perlmonks.org/?node_id=930504");
    unless (defined($content)) {die("OOPS\n");}
    if ($content =~ m'<h3 class="other">(.*)</h3>'ig) {
        my $title = $1;
        $title =~ s/&quot;/\"/g;
        print "Title is: '$title'\n\n";
    }
    else {print("OOOOO");}

    my @urls = $content =~ m|
        <\s*a\s+
        [^>]*
        href\s*=\s*['"]
        (ht[^>"']+)
        ['"]
        [^>]*>\s*
        [^<>]*
        \s*</
    |sigx;

    print("URLs are: ");
    print(Dumper(@urls));

    my @classes = $content =~ m|
        class="(.+?)"
    |sigx;

    print("Classes are: ");
    print(Dumper(@classes));
}

main();
