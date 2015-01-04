# ABSTRACT: An Undef Object Role for Perl 5
package Data::Object::Role::Undef;

use 5.010;
use Moo::Role;

our $VERSION = '0.12'; # VERSION

sub defined {
    return 0;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::Role::Undef - An Undef Object Role for Perl 5

=head1 VERSION

version 0.12

=head1 SYNOPSIS

    use Data::Object::Role::Undef;

=head1 DESCRIPTION

Data::Object::Role::Undef provides functions  for operating on Perl 5 undefined
data.

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
