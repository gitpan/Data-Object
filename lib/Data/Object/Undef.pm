# ABSTRACT: An Undef Object for Perl 5
package Data::Object::Undef;

use 5.010;

use Moo 'with';
use Scalar::Util 'blessed';
use Types::Standard 'Undef';

use Data::Object 'deduce_deep', 'detract_deep';

with 'Data::Object::Role::Undef';
with 'Data::Object::Role::Detract';
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

    $class = ref($class) || $class;
    unless (blessed($data) && $data->isa($class)) {
        $data = Undef->($data);
    }

    return bless \$data, $class;
}

sub data {
    goto &detract;
}

around 'defined' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

sub detract {
    return detract_deep shift;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::Undef - An Undef Object for Perl 5

=head1 VERSION

version 0.12

=head1 SYNOPSIS

    use Data::Object::Undef;

    my $undef = Data::Object::Undef->new(undef);

=head1 DESCRIPTION

Data::Object::Undef provides common methods for operating on Perl 5 undefined
data. Undef methods work on undefined values.

=head1 METHODS

=head2 defined

    # given undef

    $undef->defined ? 'Yes' : 'No'; # No

The defined method always returns false. This method returns a
L<Data::Object::Number> object.

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
