# ABSTRACT: A Code Object Role for Perl 5
package Data::Object::Role::Code;

use 5.010;
use Moo::Role;

use Data::Object 'codify';

our $VERSION = '0.12'; # VERSION

sub call {
    my ($code, @arguments) = @_;
    return $code->(@arguments);
}

sub curry {
    my ($code, @arguments) = @_;
    return sub { $code->(@arguments, @_) };
}

sub rcurry {
    my ($code, @arguments) = @_;
    return sub { $code->(@_, @arguments) };
}

sub compose {
    my ($code, $next, @arguments) = @_;
    $next = codify $next if !ref $next;
    return curry(sub { $next->($code->(@_)) }, @arguments);
}

sub disjoin {
    my ($code, $next) = @_;
    $next = codify $next if !ref $next;
    return sub { $code->(@_) || $next->(@_) };
}

sub conjoin {
    my ($code, $next) = @_;
    $next = codify $next if !ref $next;
    return sub { $code->(@_) && $next->(@_) };
}

sub next {
    goto &call;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::Role::Code - A Code Object Role for Perl 5

=head1 VERSION

version 0.12

=head1 SYNOPSIS

    use Data::Object::Role::Code;

=head1 DESCRIPTION

Data::Object::Role::Code provides functions for operating on Perl 5 code
references.

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
