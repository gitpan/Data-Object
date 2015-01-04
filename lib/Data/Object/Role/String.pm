# ABSTRACT: A String Object Role for Perl 5
package Data::Object::Role::String;

use 5.010;
use Moo::Role;

our $VERSION = '0.12'; # VERSION

sub append {
    return join ' ', @_;
}

sub camelcase {
    my ($string) = @_;
    $string = CORE::ucfirst(CORE::lc("$string"));
    $string =~ s/[^a-zA-Z0-9]+([a-z])/\U$1/g;
    $string =~ s/[^a-zA-Z0-9]+//g;
    return $string;
}

sub chomp {
    my ($string) = @_;
    CORE::chomp $string and return $string;
}

sub chop {
    my ($string) = @_;
    CORE::chop $string and return $string;
}

sub concat {
    my ($string, @args) = @_;
    return join '', $string, @args;
}

sub contains {
    my ($string, $pattern) = @_;

    return ($string =~ $pattern) ? 1 : 0
        if 'Regexp' eq ref $pattern;

    return index($string, $pattern) < 0 ? 0 : 1
        if defined $pattern;

    return 0;
}

sub hex {
    my ($string) = @_;
    return CORE::hex $string;
}

sub index {
    my ($string, $substr, $start) = @_;
    return CORE::index $string, $substr if not defined $start;
    return CORE::index $string, $substr, $start;
}

sub lc {
    my ($string) = @_;
    return CORE::lc $string;
}

sub lcfirst {
    my ($string) = @_;
    return CORE::lcfirst $string;
}

sub length {
    my ($string) = @_;
    return CORE::length $string;
}

sub lines {
    my ($string) = @_;
    return [CORE::split /\n+/, $string];
}

sub lowercase {
    goto &lc
}

sub replace {
    my ($self, $find, $replace, $flags) = @_;
    $flags = defined $flags ? $flags : '';
    $find  = quotemeta $find if $find and 'Regexp' ne ref $find;
    eval("sub { \$_[0] =~ s/$find/$replace/$flags }")->($self);

    return $self;
}

sub reverse {
    my ($string) = @_;
    return CORE::reverse $string;
}

sub rindex {
    my ($string, $substr, $start) = @_;
    return CORE::rindex $string, $substr if not defined $start;
    return CORE::rindex $string, $substr, $start;
}

sub snakecase {
    my ($string) = @_;
    $string = CORE::lc("$string");
    $string =~ s/[^a-zA-Z0-9]+([a-z])/\U$1/g;
    $string =~ s/[^a-zA-Z0-9]+//g;
    return $string;
}

sub split {
    my ($string, $pattern, $limit) = @_;
    $pattern = quotemeta $pattern if $pattern and !ref $pattern;
    return [CORE::split /$pattern/, $string] if !defined $limit;
    return [CORE::split /$pattern/, $string, $limit];
}

sub strip {
    my ($string) = @_;
    $string =~ s/\s{2,}/ /g and return $string;
}

sub titlecase {
    my ($string) = @_;
    $string =~ s/\b(\w)/\U$1/g and return $string;
}

sub trim {
    my ($string) = @_;
    $string =~ s/^\s+|\s+$//g and return $string;
}

sub uc {
    my ($string) = @_;
    return CORE::uc $string;
}

sub ucfirst {
    my ($string) = @_;
    return CORE::ucfirst $string;
}

sub uppercase {
    goto &uc;
}

sub words {
    my ($string) = @_;
    return [CORE::split /\s+/, $string];
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::Role::String - A String Object Role for Perl 5

=head1 VERSION

version 0.12

=head1 SYNOPSIS

    use Data::Object::Role::String;

=head1 DESCRIPTION

Data::Object::Role::String provides functions for operating on Perl 5 string
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
