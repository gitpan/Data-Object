# ABSTRACT: A Code Object for Perl 5
package Data::Object::Code;

use 5.010;

use Moo 'with';
use Scalar::Util 'blessed';
use Types::Standard 'CodeRef';

use Data::Object 'deduce_deep', 'detract_deep';

with 'Data::Object::Role::Code';
with 'Data::Object::Role::Detract';
with 'Data::Object::Role::Output';

our $VERSION = '0.09'; # VERSION

sub new {
    my $class = shift;
    my $data  = shift;

    $class = ref($class) || $class;
    unless (blessed($data) && $data->isa($class)) {
        $data = CodeRef->($data);
    }

    return bless $data, $class;
}

around 'call' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'compose' => sub {
    my ($orig, $self, @args) = @_;
    my $next = deduce_deep shift @args;
    my $result = $self->$orig($next, @args);
    return scalar deduce_deep $result;
};

around 'conjoin' => sub {
    my ($orig, $self, @args) = @_;
    my $next = deduce_deep shift @args;
    my $result = $self->$orig($next, @args);
    return scalar deduce_deep $result;
};

around 'curry' => sub {
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

around 'disjoin' => sub {
    my ($orig, $self, @args) = @_;
    my $next = deduce_deep shift @args;
    my $result = $self->$orig($next, @args);
    return scalar deduce_deep $result;
};

around 'next' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'rcurry' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::Code - A Code Object for Perl 5

=head1 VERSION

version 0.09

=head1 SYNOPSIS

    use Data::Object::Code;

    my $code = Data::Object::Code->new(sub { shift + 1 });

=head1 DESCRIPTION

Data::Object::Code provides common methods for operating on Perl 5 code
references. Code methods work on code references.

=head1 CODIFICATION

Certain methods provided by the this module support codification, a process
which converts a string argument into code reference which can be used to supply
a callback to the routine. Codified strings can access its arguments by using
variable names which correspond to letters in the alphabet which represent the
position in the argument list. For example:

    $hash->method('$a + $b * $c', 100);

    # given that $a and $b are method-supplied arguments
    # ... whereas $c is assigned the user-supplied argument, 25

=head1 METHODS

=head2 call

    # given sub { (shift // 0) + 1 }

    $code->call; # 1
    $code->call(0); # 1
    $code->call(1); # 2
    $code->call(2); # 3

The call method executes and returns the result of the code. This method returns
a data type object to be determined after execution.

=head2 compose

    # given sub { [@_] }

    $code = $code->compose($code, 1,2,3);
    $code->(4,5,6); # [[1,2,3,4,5,6]]

    # this can be confusing, here's what's really happening:
    my $listing = sub {[@_]}; # produces an arrayref of args
    $listing->($listing->(@args)); # produces a listing within a listing
    [[@args]] # the result

The compose method creates a code reference which executes the first argument
(another code reference) using the result from executing the code as it's
argument, and returns a code reference which executes the created code reference
passing it the remaining arguments when executed. This method returns a
L<Data::Object::Code> object.

=head2 conjoin

    # given sub { $_[0] % 2 }

    $code = $code->conjoin(sub { 1 });
    $code->(0); # 0
    $code->(1); # 1
    $code->(2); # 0
    $code->(3); # 1
    $code->(4); # 0

The conjoin method creates a code reference which execute the code and the
argument in a logical AND operation having the code as the lvalue and the
argument as the rvalue. This method returns a L<Data::Object::Code> object.

=head2 curry

    # given sub { [@_] }

    $code = $code->curry(1,2,3);
    $code->(4,5,6); # [1,2,3,4,5,6]

The curry method returns a code reference which executes the code passing it
the arguments and any additional parameters when executed. This method returns a
L<Data::Object::Code> object.

=head2 disjoin

    # given sub { $_[0] % 2 }

    $code = $code->disjoin(sub { -1 });
    $code->(0); # -1
    $code->(1); #  1
    $code->(2); # -1
    $code->(3); #  1
    $code->(4); # -1

The disjoin method creates a code reference which execute the code and the
argument in a logical OR operation having the code as the lvalue and the
argument as the rvalue. This method returns a L<Data::Object::Code> object.

=head2 next

    $code->next;

The next method is an alias to the call method. The naming is especially useful
(i.e. helps with readability) when used with closure-based iterators. This
method returns a L<Data::Object::Code> object. This method is an alias to the
call method.

=head2 rcurry

    # given sub { [@_] }

    $code = $code->rcurry(1,2,3);
    $code->(4,5,6); # [4,5,6,1,2,3]

The rcurry method returns a code reference which executes the code passing it
the any additional parameters and any arguments when executed. This method
returns a L<Data::Object::Code> object.

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
