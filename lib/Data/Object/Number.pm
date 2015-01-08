# ABSTRACT: A Number Object for Perl 5
package Data::Object::Number;

use 5.010;

use Moo 'with';
use Scalar::Util 'blessed';
use Types::Standard 'Num';
use Data::Object 'deduce';

with 'Data::Object::Role::Number';
with 'Data::Object::Role::Numeric';

use overload
    'bool'   => \&value,
    '""'     => \&value,
    '~~'     => \&value,
    fallback => 1,
;

our $VERSION = '0.06'; # VERSION

sub new {
    my $class = shift;
    my $data  = shift;

    $data =~ s/^\+//; # not keen on this but ...

    $class = ref($class) || $class;
    $data  = Num->($data)
        unless blessed($data) && $data->isa($class);

    return bless \$data, $class;
}

around 'abs' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'atan2' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'cos' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'decr' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'downto' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'eq' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'exp' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'gt' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'gte' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'hex' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'incr' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'int' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'lt' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'lte' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'log' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'mod' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'ne' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'neg' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'pow' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'sin' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'sqrt' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'to' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

around 'upto' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return deduce $result;
};

sub value {
    my $self = shift;
    return 0+${$self};
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::Number - A Number Object for Perl 5

=head1 VERSION

version 0.06

=head1 SYNOPSIS

    use Data::Object::Number;

    my $number = Data::Object::Number->new(1_000_000);

=head1 DESCRIPTION

Data::Object::Number provides common methods for operating on Perl 5 numeric
data. Number methods work on data that meets the criteria for being a number. A
number holds and manipulates an arbitrary sequence of bytes, typically
representing numberic characters (0-9). Users of numbers should be aware of the
methods that modify the number itself as opposed to returning a new number.
Unless stated, it may be safe to assume that the following methods copy, modify
and return new numbers based on their function.

=head1 METHODS

=head2 abs

    # given 12

    $number->abs; # 12

    $number = -12;
    $number->abs; # 12

The abs method returns the absolute value of the number. This method returns a
L<Data::Object::Number> object.

=head2 atan2

    # given 1

    $number->atan2(1); # 0.785398163397448

The atan2 method returns the arctangent of Y/X in the range -PI to PI This
method returns a L<Data::Object::Float> object.

=head2 cos

    # given 12

    $number->cos; # 0.843853958732492

The cos method computes the cosine of the number (expressed in radians). This
method returns a L<Data::Object::Float> object.

=head2 decr

    # given 123456789

    $number->decr; # 123456788

The decr method returns the numeric number decremented by 1. This method returns
a data type object to be determined after execution.

=head2 exp

    # given 0

    $number->exp; # 1

    $number = 1;
    $number->exp; # 2.71828182845905

    $number = 1.5;
    $number->exp; # 4.48168907033806

The exp method returns e (the natural logarithm base) to the power of the
number. This method returns a L<Data::Object::Float> object.

=head2 hex

    # given 175

    $number->hex; # 0xaf

The hex method returns a hex string representing the value of the number. This
method returns a L<Data::Object::String> object.

=head2 incr

    # given 123456789

    $number->incr; # 123456790

The incr method returns the numeric number incremented by 1. This method returns
a data type object to be determined after execution.

=head2 int

    # given 12.5

    $number->int; # 12

The int method returns the integer portion of the number. Do not use this
method for rounding. This method returns a L<Data::Object::Number> object.

=head2 log

    # given 12345

    $number->log; # 9.42100640177928

The log method returns the natural logarithm (base e) of the number. This method
returns a L<Data::Object::Float> object.

=head2 mod

    # given 12

    $number->mod(1); # 0
    $number->mod(2); # 0
    $number->mod(3); # 0
    $number->mod(4); # 0
    $number->mod(5); # 2

The mod method returns the division remainder of the number divided by the
argment. This method returns a L<Data::Object::Number> object.

=head2 neg

    # given 12345

    $number->neg; # -12345

The neg method returns a negative version of the number. This method returns a
L<Data::Object::Integer> object.

=head2 pow

    # given 12345

    $number->pow(3); # 1881365963625

The pow method returns a number, the result of a math operation, which is the
number to the power of the argument. This method returns a
L<Data::Object::Number> object.

=head2 sin

    # given 12345

    $number->sin; # -0.993771636455681

The sin method returns the sine of the number (expressed in radians). This
method returns a data type object to be determined after execution.

=head2 sqrt

    # given 12345

    $number->sqrt; # 111.108055513541

The sqrt method returns the positive square root of the number. This method
returns a data type object to be determined after execution.

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
