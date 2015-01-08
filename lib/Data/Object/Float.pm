# ABSTRACT: A Float Object for Perl 5
package Data::Object::Float;

use 5.010;

use Moo 'with';
use Scalar::Util 'blessed';
use Types::Standard 'Num';

use Data::Object 'deduce_deep', 'detract_deep';

with 'Data::Object::Role::Float';
with 'Data::Object::Role::Defined';
with 'Data::Object::Role::Detract';
with 'Data::Object::Role::Numeric';
with 'Data::Object::Role::Output';

use overload
    'bool'   => \&data,
    '""'     => \&data,
    '~~'     => \&data,
    fallback => 1,
;

our $VERSION = '0.12'; # VERSION

sub new {
    my $class = shift;
    my $data  = shift;

    $data =~ s/^\+//; # not keen on this but ...

    $class = ref($class) || $class;
    unless (blessed($data) && $data->isa($class)) {
        $data = Num->($data);
    }

    return bless \$data, $class;
}

sub data {
    goto &detract;
}

sub detract {
    return detract_deep shift;
}

around 'downto' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'eq' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'gt' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'gte' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'lt' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'lte' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'ne' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'to' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'upto' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::Float - A Float Object for Perl 5

=head1 VERSION

version 0.12

=head1 SYNOPSIS

    use Data::Object::Float;

    my $float = Data::Object::Float->new(9.9999);

=head1 DESCRIPTION

Data::Object::Float provides common methods for operating on Perl 5
floating-point data. Float methods work on data that meets the criteria for
being a floating-point number. A float holds and manipulates an arbitrary
sequence of bytes, typically representing numberic characters with decimals.
Users of floats should be aware of the methods that modify the float itself as
opposed to returning a new float. Unless stated, it may be safe to assume that
the following methods copy, modify and return new floats based on their
function.

=head1 SEE ALSO

=over 4

=item *

L<Data::Object::Array>

=item *

L<Data::Object::Code>

=item *

L<Data::Object::Float>

=item *

L<Data::Object::Hash>

=item *

L<Data::Object::Integer>

=item *

L<Data::Object::Number>

=item *

L<Data::Object::Scalar>

=item *

L<Data::Object::String>

=item *

L<Data::Object::Undef>

=item *

L<Data::Object::Universal>

=item *

L<Data::Object::Autobox>

=back

=head1 AUTHOR

Al Newkirk <anewkirk@ana.io>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Al Newkirk.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
