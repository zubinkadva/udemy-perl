package Welcome::Greeting;

use warnings FATAL => 'all';

use Exporter qw(import);

@EXPORT_OK = qw(greet);
# @EXPORT = qw(greet); # BAD PRACTICE

sub greet() {
    print("This is a test");
}

1;