# ABSTRACT: A Scalar Object Role for Perl 5
package Data::Object::Role::Scalar;

use 5.010;
use Moo::Role;

our $VERSION = '0.09'; # VERSION

sub and {
    return $_[0] && $_[1];
}

sub not {
    return ! shift;
}

sub or {
    return $_[0] || $_[1];
}

sub xor {
    return ($_[0] xor $_[1]) ? 1 : 0;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::Role::Scalar - A Scalar Object Role for Perl 5

=head1 VERSION

version 0.09

=head1 SYNOPSIS

    use Data::Object::Role::Scalar;

=head1 DESCRIPTION

Data::Object::Role::Scalar provides functions for operating on Perl 5 scalar
objects.

=head1 SEE ALSO

=over 4

=item *

L<Data::Object::Role::Array>

=item *

L<Data::Object::Role::Code>

=item *

L<Data::Object::Role::Float>

=item *

L<Data::Object::Role::Hash>

=item *

L<Data::Object::Role::Integer>

=item *

L<Data::Object::Role::Number>

=item *

L<Data::Object::Role::Scalar>

=item *

L<Data::Object::Role::String>

=item *

L<Data::Object::Role::Undef>

=item *

L<Data::Object::Role::Universal>

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
