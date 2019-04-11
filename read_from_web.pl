use strict;
use warnings;

use LWP::Simple;

sub main() {

    # print( get("https://www.google.com") );

    # getstore("https://www.google.com", "google.html");

    my $return_code = getstore(
"https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
        "image.png"
    );

    if ( $return_code == 200 ) {
        print("OK");
    }
    else {
        print("OOPS");
    }
}

main();
