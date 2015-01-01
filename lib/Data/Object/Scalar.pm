# ABSTRACT: A Scalar Object for Perl 5
package Data::Object::Scalar;

use 5.010;

use Moo 'with';
use Scalar::Util 'blessed';
use Types::Standard 'Defined';

use Data::Object 'deduce_deep', 'detract_deep';

with 'Data::Object::Role::Constructor';
with 'Data::Object::Role::Scalar';
with 'Data::Object::Role::Detract';
with 'Data::Object::Role::Output';

our $VERSION = '0.10'; # VERSION

around 'and' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

sub data {
    goto &detract;
}

sub detract {
    return detract_deep shift;
}

around 'not' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'or' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'xor' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::Scalar - A Scalar Object for Perl 5

=head1 VERSION

version 0.10

=head1 SYNOPSIS

    use Data::Object::Scalar;

    my $scalar = Data::Object::Scalar->new(qr/\w/);

=head1 DESCRIPTION

Data::Object::Scalar provides common methods for operating on Perl 5 scalar
objects. Scalar methods work on data that meets the criteria for being a scalar.

=head1 METHODS

=head2 and

    # given 12345;

    $scalar->and(56789); # 56789

    # given 0;

    $scalar->and(56789); # 0

The and method performs a short-circuit logical AND operation using the string
as the lvalue and the argument as the rvalue and returns the last truthy value
or false. This method returns a data type object to be determined after
execution.

=head2 not

    # given 0;

    $scalar->not; # 1

    # given 1;

    $scalar->not; # ''

The not method performs a logical negation of the string. It's the equivalent
of using bang (!) and return true (1) or false (empty string). This method
returns a data type object to be determined after execution.

=head2 or

    # given 12345;

    $scalar->or(56789); # 12345

    # given 00000;

    $scalar->or(56789); # 56789

The or method performs a short-circuit logical OR operation using the string
as the lvalue and the argument as the rvalue and returns the first truthy value.
This method returns a data type object to be determined after execution.

=head2 xor

    # given 1;

    $scalar->xor(1); # 0
    $scalar->xor(0); # 1

The xor method performs an exclusive OR operation using the string as the
lvalue and the argument as the rvalue and returns true if either but not both
is true. This method returns a data type object to be determined after
execution.

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
