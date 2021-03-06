# ABSTRACT: A String Object for Perl 5
package Data::Object::String;

use 5.010;

use Moo 'with';
use Scalar::Util 'blessed';
use Types::Standard 'Str';

use Data::Object 'deduce_deep', 'detract_deep';

with 'Data::Object::Role::String';
with 'Data::Object::Role::Defined';
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
        $data = Str->($data);
    }

    return bless \$data, $class;
}

around 'append' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'camelcase' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'chomp' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'chop' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'concat' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'contains' => sub {
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

around 'hex' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'index' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'lc' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'lcfirst' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'length' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'lines' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'lowercase' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'replace' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'reverse' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'rindex' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'snakecase' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'split' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'strip' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'titlecase' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'trim' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'uc' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'ucfirst' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'uppercase' => sub {
    my ($orig, $self, @args) = @_;
    $$self = $self->$orig(@args);
    return $self;
};

around 'words' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::String - A String Object for Perl 5

=head1 VERSION

version 0.12

=head1 SYNOPSIS

    use Data::Object::String;

    my $string = Data::Object::String->new('abcedfghi');

=head1 DESCRIPTION

Data::Object::String provides common methods for operating on Perl 5 string
data. String methods work on data that meets the criteria for being a string. A
string holds and manipulates an arbitrary sequence of bytes, typically
representing characters. Users of strings should be aware of the methods that
modify the string itself as opposed to returning a new string. Unless stated, it
may be safe to assume that the following methods copy, modify and return new
strings based on their function.

=head1 METHODS

=head2 append

    # given 'firstname'

    $string->append('lastname'); # firstname lastname

The append method modifies and returns the string with the argument list
appended to it separated using spaces. This method returns a
L<Data::Object::String> object.

=head2 camelcase

    # given 'hello world'

    $string->camelcase; # HelloWorld

The camelcase method modifies the string such that it will no longer have any
non-alphanumeric characters and each word (group of alphanumeric characters
separated by 1 or more non-alphanumeric characters) is capitalized. Note, this
method modifies the string. This method returns a L<Data::Object::String>
object.

=head2 chomp

    # given "name, age, dob, email\n"

    $string->chomp; # name, age, dob, email

The chomp method is a safer version of the chop method, it's used to remove the
newline (or the current value of $/) from the end of the string. Note, this
method modifies and returns the string. This method returns a
L<Data::Object::String> object.

=head2 chop

    # given "this is just a test."

    $string->chop; # this is just a test

The chop method removes the last character of a string and returns the character
chopped. It is much more efficient than "s/.$//s" because it neither scans nor
copies the string. Note, this method modifies and returns the string. This
method returns a L<Data::Object::String> object.

=head2 concat

    # given 'ABC'

    $string->concat('DEF', 'GHI'); # ABCDEFGHI

The concat method modifies and returns the string with the argument list
appended to it. This method returns a L<Data::Object::String> object.

=head2 contains

    # given 'Nullam ultrices placerat nibh vel malesuada.'

    $string->contains('trices'); # 1; true
    $string->contains('itrices'); # 0; false

    $string->contains(qr/trices/); # 1; true
    $string->contains(qr/itrices/); # 0; false

The contains method searches the string for the string specified in the
argument and returns true if found, otherwise returns false. If the argument is
a string, the search will be performed using the core index function. If the
argument is a regular expression reference, the search will be performed using
the regular expression engine. This method returns a L<Data::Object::Number>
object.

=head2 hex

    # given '0xaf'

    string->hex; # 175

The hex method returns the value resulting from interpreting the string as a
hex string. This method returns a data type object to be determined after
execution.

=head2 index

    # given 'unexplainable'

    $string->index('explain'); # 2
    $string->index('explain', 0); # 2
    $string->index('explain', 1); # 2
    $string->index('explain', 2); # 2
    $string->index('explain', 3); # -1
    $string->index('explained'); # -1

The index method searches for the argument within the string and returns the
position of the first occurrence of the argument. This method optionally takes a
second argument which would be the position within the string to start
searching from (also known as the base). By default, starts searching from the
beginning of the string. This method returns a data type object to be determined
after execution.

=head2 lc

    # given 'EXCITING'

    $string->lc; # exciting

The lc method returns a lowercased version of the string. This method returns a
L<Data::Object::String> object. This method is an alias to the lowercase method.

=head2 lcfirst

    # given 'EXCITING'

    $string->lcfirst; # eXCITING

The lcfirst method returns a the string with the first character lowercased.
This method returns a L<Data::Object::String> object.

=head2 length

    # given 'longggggg'

    $string->length; # 9

The length method returns the number of characters within the string. This
method returns a L<Data::Object::Number> object.

=head2 lines

    # given "who am i?\nwhere am i?\nhow did I get here"

    $string->lines; # ['who am i?','where am i?','how did i get here']

The lines method breaks the string into pieces, split on 1 or more newline
characters, and returns an array reference consisting of the pieces. This method
returns a L<Data::Object::Array> object.

=head2 lowercase

    # given 'EXCITING'

    $string->lowercase; # exciting

The lowercase method is an alias to the lc method. This method returns a
L<Data::Object::String> object.

=head2 replace

    # given 'Hello World'

    $string->replace('World', 'Universe'); # Hello Universe
    $string->replace('world', 'Universe', 'i'); # Hello Universe
    $string->replace(qr/world/i, 'Universe'); # Hello Universe
    $string->replace(qr/.*/, 'Nada'); # Nada

The replace method performs a smart search and replace operation and returns the
modified string (if any modification occurred). This method optionally takes a
replacement modifier as it's final argument. Note, this operation expects the
2nd argument to be a replacement String. This method returns a
L<Data::Object::String> object.

=head2 reverse

    # given 'dlrow ,olleH'

    $string->reverse; # Hello, world

The reverse method returns a string where the characters in the string are in
the opposite order. This method returns a L<Data::Object::String> object.

=head2 rindex

    # given 'explain the unexplainable'

    $string->rindex('explain'); # 14
    $string->rindex('explain', 0); # 0
    $string->rindex('explain', 21); # 14
    $string->rindex('explain', 22); # 14
    $string->rindex('explain', 23); # 14
    $string->rindex('explain', 20); # 14
    $string->rindex('explain', 14); # 0
    $string->rindex('explain', 13); # 0
    $string->rindex('explain', 0); # 0
    $string->rindex('explained'); # -1

The rindex method searches for the argument within the string and returns the
position of the last occurrence of the argument. This method optionally takes a
second argument which would be the position within the string to start
searching from (beginning at or before the position). By default, starts
searching from the end of the string. This method returns a data type object to
be determined after execution.

=head2 snakecase

    # given 'hello world'

    $string->snakecase; # helloWorld

The snakecase method modifies the string such that it will no longer have any
non-alphanumeric characters and each word (group of alphanumeric characters
separated by 1 or more non-alphanumeric characters) is capitalized. The only
difference between this method and the camelcase method is that this method
ensures that the first character will always be lowercased. Note, this method
modifies the string. This method returns a L<Data::Object::String> object.

=head2 split

    # given 'name, age, dob, email'

    $string->split(', '); # ['name', 'age', 'dob', 'email']
    $string->split(', ', 2); # ['name', 'age, dob, email']
    $string->split(qr/\,\s*/); # ['name', 'age', 'dob', 'email']
    $string->split(qr/\,\s*/, 2); # ['name', 'age, dob, email']

The split method splits the string into a list of strings, separating each
chunk by the argument (string or regexp object), and returns that list as an
array reference. This method optionally takes a second argument which would be
the limit (number of matches to capture). Note, this operation expects the 1st
argument to be a Regexp object or a String. This method returns a
L<Data::Object::Array> object.

=head2 strip

    # given 'one,  two,  three'

    $string->strip; # one, two, three

The strip method returns the string replacing occurences of 2 or more
whitespaces with a single whitespace. This method returns a
L<Data::Object::String> object.

=head2 titlecase

    # given 'mr. wellington III'

    $string->titlecase; # Mr. Wellington III

The titlecase method returns the string capitalizing the first character of
each word (group of alphanumeric characters separated by 1 or more whitespaces).
Note, this method modifies the string. This method returns a
L<Data::Object::String> object.

=head2 trim

    # given ' system is   ready   '

    $string->trim; # system is   ready

The trim method removes 1 or more consecutive leading and/or trailing spaces
from the string. This method returns a L<Data::Object::String> object.

=head2 uc

    # given 'exciting'

    $string->uc; # EXCITING

The uc method returns an uppercased version of the string. This method returns a
L<Data::Object::String> object. This method is an alias to the uppercase method.

=head2 ucfirst

    # given 'exciting'

    $string->ucfirst; # Exciting

The ucfirst method returns a the string with the first character uppercased.
This method returns a L<Data::Object::String> object.

=head2 uppercase

    # given 'exciting'

    $string->uppercase; # EXCITING

The uppercase method is an alias to the uc method. This method returns a
L<Data::Object::String> object.

=head2 words

    # given "is this a bug we're experiencing"

    $string->words; # ["is","this","a","bug","we're","experiencing"]

The words method splits the string into a list of strings, separating each
group of characters by 1 or more consecutive spaces, and returns that list as an
array reference. This method returns a L<Data::Object::Array> object.

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
