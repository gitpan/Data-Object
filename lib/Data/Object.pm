# ABSTRACT: Data Type Objects for Perl 5
package Data::Object;

use 5.10.0;

use strict;
use warnings;

our $VERSION = '0.02'; # VERSION

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object - Data Type Objects for Perl 5

=head1 VERSION

version 0.02

=head1 SYNOPSIS

    use Data::Object;

=head1 DESCRIPTION

Data::Object provides functions for promoting to Perl 5 native data types to
objects which provide common methods for operating on the data.

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

=back

=head1 AUTHOR

Al Newkirk <anewkirk@ana.io>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Al Newkirk.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
