# ABSTRACT: Data Type Objects for Perl 5
package Data::Object;

use 5.010;
use strict;
use warnings;

use Carp;

use Data::Dumper ();
use Types::Standard ();

use Exporter qw(import);
use Scalar::Util qw(blessed looks_like_number reftype);

our @EXPORT_OK = qw(
    data_array
    data_code
    data_float
    data_hash
    data_integer
    data_number
    data_scalar
    data_string
    data_undef
    data_universal
    deduce
    deduce_deep
    deduce_type
    detract
    detract_deep
    load
    type_array
    type_code
    type_float
    type_hash
    type_integer
    type_number
    type_scalar
    type_string
    type_undef
    type_universal
);

our $VERSION = '0.10'; # VERSION

sub load ($) {
    my $class = shift;
    my $failed = ! $class || $class !~ /^\w(?:[\w:']*\w)?$/;
    my $loaded = $class->can('new') || eval "require $class; 1";

    croak join ": ", "Error attempting to load $class", $@
        if $@ or $failed or not $loaded;

    return $class;
}

sub data_array ($) {
    unshift @_, my $class = load 'Data::Object::Array';
    goto $class->can('new');
}

sub data_code ($) {
    unshift @_, my $class = load 'Data::Object::Code';
    goto $class->can('new');
}

sub data_float ($) {
    unshift @_, my $class = load 'Data::Object::Float';
    goto $class->can('new');
}

sub data_hash ($) {
    unshift @_, my $class = load 'Data::Object::Hash';
    goto $class->can('new');
}

sub data_integer ($) {
    unshift @_, my $class = load 'Data::Object::Integer';
    goto $class->can('new');
}

sub data_number ($) {
    unshift @_, my $class = load 'Data::Object::Number';
    goto $class->can('new');
}

sub data_scalar ($) {
    unshift @_, my $class = load 'Data::Object::Scalar';
    goto $class->can('new');
}

sub data_string ($) {
    unshift @_, my $class = load 'Data::Object::String';
    goto $class->can('new');
}

sub data_undef ($) {
    unshift @_, my $class = load 'Data::Object::Undef';
    goto $class->can('new');
}

sub data_universal ($) {
    unshift @_, my $class = load 'Data::Object::Universal';
    goto $class->can('new');
}

sub deduce ($) {
    my $scalar = shift;

    # return undef
    if (not defined $scalar) {
        return data_undef $scalar;
    }

    # handle blessed objects
    elsif (blessed $scalar) {
        return data_scalar $scalar if $scalar->isa('Regexp');
        return $scalar;
    }

    # handle data types
    # ... using spaces for clarity
    else {

        # handle references
        if (ref $scalar) {
            return data_array $scalar if 'ARRAY' eq ref $scalar;
            return data_hash  $scalar if 'HASH'  eq ref $scalar;
            return data_code  $scalar if 'CODE'  eq ref $scalar;
        }

        # handle non-references
        else {
            if (looks_like_number $scalar) {
                return data_float   $scalar if $scalar =~ /\./;
                return data_number  $scalar if $scalar =~ /^\d+$/;
                return data_integer $scalar;
            }
            else {
                return data_string $scalar;
            }
        }

        # handle unhandled
        return data_scalar $scalar;

    }

    # fallback
    return data_undef $scalar;
}

sub deduce_deep {
    my @objects = @_;

    for my $object (@objects) {
        my $type;

        $object = deduce($object);
        $type   = deduce_type($object);

        if ($type and $type eq 'HASH') {
            for my $i (keys %$object) {
                my $val = $object->{$i};
                $object->{$i} = ref($val) ? deduce_deep($val) : deduce($val);
            }
        }

        if ($type and $type eq 'ARRAY') {
            for (my $i = 0; $i < @$object; $i++) {
                my $val = $object->[$i];
                $object->[$i] = ref($val) ? deduce_deep($val) : deduce($val);
            }
        }
    }

    return wantarray ? (@objects) : $objects[0];
}

sub deduce_type ($) {
    my $object = deduce shift;

    return 'ARRAY'     if $object->isa('Data::Object::Array');
    return 'HASH'      if $object->isa('Data::Object::Hash');
    return 'CODE'      if $object->isa('Data::Object::Code');

    return 'FLOAT'     if $object->isa('Data::Object::Float');
    return 'NUMBER'    if $object->isa('Data::Object::Number');
    return 'INTEGER'   if $object->isa('Data::Object::Integer');

    return 'STRING'    if $object->isa('Data::Object::String');
    return 'SCALAR'    if $object->isa('Data::Object::Scalar');

    return 'UNDEF'     if $object->isa('Data::Object::Undef');
    return 'UNIVERSAL' if $object->isa('Data::Object::Universal');

    return undef;
}

sub detract ($) {
    my $object = deduce shift;
    my $type   = deduce_type $object;

    INSPECT:
    if (blessed($object) and ($object->isa('Regexp') or not $type)) {
        return $object;
    }

    return [@$object] if $type eq 'ARRAY';
    return {%$object} if $type eq 'HASH';
    return $$object   if $type eq 'FLOAT';
    return $$object   if $type eq 'NUMBER';
    return $$object   if $type eq 'INTEGER';
    return $$object   if $type eq 'STRING';
    return undef      if $type eq 'UNDEF';

    if ($type eq 'SCALAR' or $type eq 'UNIVERSAL') {
        $type = reftype $object // '';

        return [@$object] if $type eq 'ARRAY';
        return {%$object} if $type eq 'HASH';
        return $$object   if $type eq 'FLOAT';
        return $$object   if $type eq 'INTEGER';
        return $$object   if $type eq 'NUMBER';
        return $$object   if $type eq 'REGEXP';
        return $$object   if $type eq 'SCALAR';
        return $$object   if $type eq 'STRING';
        return undef      if $type eq 'UNDEF';

        if ($type eq 'REF') {
            $type = deduce_type($object = $$object)
                and goto INSPECT;
        }
    }

    if ($type eq 'CODE') {
        return sub { goto &{$object} };
    }

    return undef;
}

sub detract_deep {
    my @objects = @_;

    for my $object (@objects) {
        $object = detract($object);

        if ($object and 'HASH' eq ref $object) {
            for my $i (keys %$object) {
                my $val = $object->{$i};
                $object->{$i} = ref($val) ? detract_deep($val) : detract($val);
            }
        }

        if ($object and 'ARRAY' eq ref $object) {
            for (my $i = 0; $i < @$object; $i++) {
                my $val = $object->[$i];
                $object->[$i] = ref($val) ? detract_deep($val) : detract($val);
            }
        }
    }

    return wantarray ? (@objects) : $objects[0];
}

{
    # aliases
    no warnings 'once';

    *type_array     = \&data_array;
    *type_code      = \&data_code;
    *type_float     = \&data_float;
    *type_hash      = \&data_hash;
    *type_integer   = \&data_integer;
    *type_number    = \&data_number;
    *type_scalar    = \&data_scalar;
    *type_string    = \&data_string;
    *type_undef     = \&data_undef;
    *type_universal = \&data_universal;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object - Data Type Objects for Perl 5

=head1 VERSION

version 0.10

=head1 SYNOPSIS

    use Data::Object 'deduce';

    my $object = deduce [1..9];

    $object->isa('Data::Object::Array'); # 1
    $object->count; # 9

=head1 DESCRIPTION

Data::Object provides functions for promoting Perl 5 native data types to
objects which provide common methods for operating on the data. B<Note: This is
an early release available for testing and feedback and as such is subject to
change.>

=head1 FUNCTIONS

=head2 data_array

    # given [2..5];

    $object = data_array [2..5];
    $object->isa('Data::Object::Array');

The data_array function returns a L<Data::Object::Array> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_array> function is an alias to this function.

=head2 data_code

    # given sub { 1 };

    $object = data_code sub { 1 };
    $object->isa('Data::Object::Code');

The data_code function returns a L<Data::Object::Code> instance which wraps the
provided data type and can be used to perform operations on the data. The
C<type_code> function is an alias to this function.

=head2 data_float

    # given 5.25;

    $object = data_float 5.25;
    $object->isa('Data::Object::Float');

The data_float function returns a L<Data::Object::Float> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_float> function is an alias to this function.

=head2 data_hash

    # given {1..4};

    $object = data_hash {1..4};
    $object->isa('Data::Object::Hash');

The data_hash function returns a L<Data::Object::Hash> instance which wraps the
provided data type and can be used to perform operations on the data. The
C<type_hash> function is an alias to this function.

=head2 data_integer

    # given -100;

    $object = data_integer -100;
    $object->isa('Data::Object::Integer');

The data_integer function returns a L<Data::Object::Object> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_integer> function is an alias to this function.

=head2 data_number

    # given 100;

    $object = data_number 100;
    $object->isa('Data::Object::Number');

The data_number function returns a L<Data::Object::Number> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_number> function is an alias to this function.

=head2 data_scalar

    # given qr/\w+/;

    $object = data_scalar qr/\w+/;
    $object->isa('Data::Object::Scalar');

The data_scalar function returns a L<Data::Object::Scalar> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_scalar> function is an alias to this function.

=head2 data_string

    # given 'abcdefghi';

    $object = data_string 'abcdefghi';
    $object->isa('Data::Object::String');

The data_string function returns a L<Data::Object::String> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_string> function is an alias to this function.

=head2 data_undef

    # given undef;

    $object = data_undef undef;
    $object->isa('Data::Object::Undef');

The data_undef function returns a L<Data::Object::Undef> instance which wraps
the provided data type and can be used to perform operations on the data. The
C<type_undef> function is an alias to this function.

=head2 data_universal

    # given 0;

    $object = data_universal 0;
    $object->isa('Data::Object::Universal');

The data_universal function returns a L<Data::Object::Universal> instance which
wraps the provided data type and can be used to perform operations on the data.
The C<type_universal> function is an alias to this function.

=head2 load

    # given 'List::Util';

    $package = load 'List::Util'; # List::Util if loaded

The load function attempts to dynamically load a module and either dies or
returns the package name of the loaded module.

=head2 deduce

    # given qr/\w+/;

    $object = deduce qr/\w+/;
    $object->isa('Data::Object::Scalar');

The deduce function returns a data type object instance based upon the deduced
type of data provided.

=head2 deduce_deep

    # given {1,2,3,{4,5,6,[-1]}}

    $deep = deduce_deep {1,2,3,{4,5,6,[-1]}}; # produces ...

    # Data::Object::Hash {
    #     1 => Data::Object::Number ( 2 ),
    #     3 => Data::Object::Hash {
    #          4 => Data::Object::Number ( 5 ),
    #          6 => Data::Object::Array [ Data::Object::Integer ( -1 ) ],
    #     },
    # }

The deduce_deep function returns a data type object. If the data provided is
complex, this function traverses the data converting all nested data to objects.
Note: Blessed objects are not traversed.

=head2 deduce_type

    # given qr/\w+/;

    $type = deduce_type qr/\w+/; # SCALAR

The deduce_type function returns a data type description for the type of data
provided, represented as a string in capital letters.

=head2 detract

    # given bless({1..4}, 'Data::Object::Hash');

    $object = detract $object; # {1..4}

The detract function returns a value of native type, based upon the underlying
reference of the data type object provided.

=head2 detract_deep

    # given {1,2,3,{4,5,6,[-1, 99, bless({}), sub { 123 }]}};

    my $object = deduce_deep $object;
    my $revert = detract_deep $object; # produces ...

    # {
    #     '1' => 2,
    #     '3' => {
    #         '4' => 5,
    #         '6' => [ -1, 99, bless({}, 'main'), sub { ... } ]
    #       }
    # }

The detract_deep function returns a value of native type. If the data provided
is complex, this function traverses the data converting all nested data type
objects into native values using the objects underlying reference. Note:
Blessed objects are not traversed.

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
