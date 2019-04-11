package Welcome::Person;
use strict;
use warnings FATAL => 'all';

sub new() {
    my $class = shift();
    my $self = {
        "name" => shift(),
        "age"  => shift()
    };
    bless($self, $class);
    return $self;
}

sub greet() {
    my ($self, $name) = @_;
    print("Hello $name, I am $self->{'name'}");
}

1;