use strict;
use warnings;

sub is_exists() {
    my $file = "image.png";
    if ( -f $file ) {
        print("OK $file");
    }
    else {
        print("OOPS");
    }
}

is_exists();

sub array() {
    my @arr = ( 1, 2, 3, 4, 5 );
    foreach my $i (@arr) {
        print("$i ");
    }
}

array();
