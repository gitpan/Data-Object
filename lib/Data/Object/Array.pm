# ABSTRACT: An Array Object for Perl 5
package Data::Object::Array;

use 5.010;

use Moo 'with';
use Scalar::Util 'blessed';
use Types::Standard 'ArrayRef';

use Data::Object 'deduce_deep', 'detract_deep';

with 'Data::Object::Role::Array';
with 'Data::Object::Role::Detract';
with 'Data::Object::Role::Output';
with 'Data::Object::Role::Values';

our $VERSION = '0.10'; # VERSION

sub new {
    my $class = shift;
    my $data  = shift;

    $class = ref($class) || $class;
    unless (blessed($data) && $data->isa($class)) {
        $data = ArrayRef->($data);
    }

    return bless $data, $class;
}

around 'all' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'any' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'clear' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'count' => sub {
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

around 'defined' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'delete' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'each' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'each_key' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'each_n_values' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'each_value' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'empty' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'exists' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'first' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'get' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'grep' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'hashify' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'head' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'iterator' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'join' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'keyed' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'keys' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'last' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'length' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

sub list {
    goto &values;
}

around 'map' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'max' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'min' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'none' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'nsort' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'one' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'pairs' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'pairs_array' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'pairs_hash' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'part' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'pop' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'push' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'random' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'reverse' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'rnsort' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'rotate' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'rsort' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'set' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'shift' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'size' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'slice' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'sort' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'sum' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'tail' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'unique' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'unshift' => sub {
    my ($orig, $self, @args) = @_;
    my $result = $self->$orig(@args);
    return scalar deduce_deep $result;
};

around 'values' => sub {
    my ($orig, $self, @args) = @_;
    my $result = deduce_deep $self->$orig(@args);
    return wantarray ? (@$result) : $result;
};

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Data::Object::Array - An Array Object for Perl 5

=head1 VERSION

version 0.10

=head1 SYNOPSIS

    use Data::Object::Array;

    my $array = Data::Object::Array->new([1..9]);

=head1 DESCRIPTION

Data::Object::Array provides common methods for operating on Perl 5 array
references. Array methods work on array references. Users of these methods
should be aware of the methods that modify the array reference itself as opposed
to returning a new array reference. Unless stated, it may be safe to assume that
the following methods copy, modify and return new array references based on
their function.

=head1 CODIFICATION

Certain methods provided by the this module support codification, a process
which converts a string argument into code reference which can be used to supply
a callback to the routine. Codified strings can access its arguments by using
variable names which correspond to letters in the alphabet which represent the
position in the argument list. For example:

    $array->method('$a + $b * $c', 100);

    # given that $a and $b are method-supplied arguments
    # ... whereas $c is assigned the user-supplied argument, 25

=head1 METHODS

=head2 all

    # given [2..5]

    $array->all('$a > 1'); # 1; true
    $array->all('$a > 3'); # 0; false

The all method returns true if all of the elements in the array meet the
criteria set by the operand and rvalue. This method supports codification, i.e,
takes an argument which can be a codifiable string, a code reference, or a code
data type object. This method returns a L<Data::Object::Number> object.

=head2 any

    # given [2..5]

    $array->any('$a > 5'); # 0; false
    $array->any('$a > 3'); # 1; true

The any method returns true if any of the elements in the array meet the
criteria set by the operand and rvalue. This method supports codification, i.e,
takes an argument which can be a codifiable string, a code reference, or a code
data type object. This method returns a L<Data::Object::Number> object.

=head2 clear

    # given ['a'..'g']

    $array->clear; # []

The clear method is an alias to the empty method. This method returns a
L<Data::Object::Undef> object. This method is an alias to the empty method.
Note: This method modifies the array.

=head2 count

    # given [1..5]

    $array->count; # 5

The count method returns the number of elements within the array. This method
returns a L<Data::Object::Number> object.

=head2 defined

    # given [1,2,undef,4,5]

    $array->defined(2); # 0; false
    $array->defined(1); # 1; true

The defined method returns true if the element within the array at the index
specified by the argument meets the criteria for being defined, otherwise it
returns false. This method returns a L<Data::Object::Number> object.

=head2 delete

    # given [1..5]

    $array->delete(2); # 3

The delete method returns the value of the element within the array at the
index specified by the argument after removing it from the array. This method
returns a data type object to be determined after execution. Note: This method
modifies the array.

=head2 each

    # given ['a'..'g']

    $array->each(sub{
        my $index = shift; # 0
        my $value = shift; # a
        ...
    });

The each method iterates over each element in the array, executing the code
reference supplied in the argument, passing the routine the index and value at
the current position in the loop. This method supports codification, i.e, takes
an argument which can be a codifiable string, a code reference, or a code data
type object. This method returns a L<Data::Object::Array> object.

=head2 each_key

    # given ['a'..'g']

    $array->each_key(sub{
        my $index = shift; # 0
        ...
    });

The each_key method iterates over each element in the array, executing the
code reference supplied in the argument, passing the routine the index at the
current position in the loop. This method supports codification, i.e, takes an
argument which can be a codifiable string, a code reference, or a code data type
object. This method returns a L<Data::Object::Array> object.

=head2 each_n_values

    # given ['a'..'g']

    $array->each_n_values(4, sub{
        my $value_1 = shift; # a
        my $value_2 = shift; # b
        my $value_3 = shift; # c
        my $value_4 = shift; # d
        ...
    });

The each_n_values method iterates over each element in the array, executing
the code reference supplied in the argument, passing the routine the next n
values until all values have been seen. This method supports codification, i.e,
takes an argument which can be a codifiable string, a code reference, or a code
data type object. This method returns a L<Data::Object::Array> object.

=head2 each_value

    # given ['a'..'g']

    $array->each_value(sub{
        my $value = shift; # a
        ...
    });

The each_value method iterates over each element in the array, executing the
code reference supplied in the argument, passing the routine the value at the
current position in the loop. This method supports codification, i.e, takes an
argument which can be a codifiable string, a code reference, or a code data type
object. This method returns a L<Data::Object::Array> object.

=head2 empty

    # given ['a'..'g']

    $array->empty; # []

The empty method drops all elements from the array. This method returns a
L<Data::Object::Array> object. Note: This method modifies the array.

=head2 exists

    # given [1,2,3,4,5]

    $array->exists(5); # 0; false
    $array->exists(0); # 1; true

The exists method returns true if the element within the array at the index
specified by the argument exists, otherwise it returns false. This method
returns a L<Data::Object::Number> object.

=head2 first

    # given [1..5]

    $array->first; # 1

The first method returns the value of the first element in the array. This
method returns a data type object to be determined after execution.

=head2 get

    # given [1..5]

    $array->get(0); # 1;

The get method returns the value of the element in the array at the index
specified by the argument. This method returns a data type object to be
determined after execution.

=head2 grep

    # given [1..5]

    $array->grep(sub{
        shift >= 3
    });

    # [3,4,5]

The grep method iterates over each element in the array, executing the
code reference supplied in the argument, passing the routine the value at the
current position in the loop and returning a new array reference containing
the elements for which the argument evaluated true. This method supports
codification, i.e, takes an argument which can be a codifiable string, a code
reference, or a code data type object. This method returns a
L<Data::Object::Array> object.

=head2 hashify

    # given [1..5]

    $array->hashify; # {1=>1,2=>1,3=>1,4=>1,5=>1}

The hashify method returns a hash reference where the elements of array become
the hash keys and the corresponding values are assigned a value of 1. Note,
undefined elements will be dropped. This method returns a L<Data::Object::Hash>
object.

=head2 head

    # given [1..5]

    $array->head; # 1

The head method returns the value of the first element in the array. This method
returns a data type object to be determined after execution.

=head2 iterator

    # given [1..5]

    my $iterator = $array->iterator;
    while (my $value = $iterator->next) {
        say $value; # 1
    }

The iterator method returns a code reference which can be used to iterate over
the array. Each time the iterator is executed it will return the next element
in the array until all elements have been seen, at which point the iterator
will return an undefined value. This method returns a L<Data::Object::Code>
object.

=head2 join

    # given [1..5]

    $array->join; # 12345
    $array->join(', '); # 1, 2, 3, 4, 5

The join method returns a string consisting of all the elements in the array
joined by the join-string specified by the argument. Note: If the argument is
omitted, an empty string will be used as the join-string. This method returns a
L<Data::Object::String> object.

=head2 keyed

    # given [1..5]

    $array->keyed('a'..'d'); # {a=>1,b=>2,c=>3,d=>4}

The keyed method returns a hash reference where the arguments become the keys,
and the elements of the array become the values. This method returns a
L<Data::Object::Hash> object.

=head2 keys

    # given ['a'..'d']

    $array->keys; # [0,1,2,3]

The keys method returns an array reference consisting of the indicies of the
array. This method returns a L<Data::Object::Array> object.

=head2 last

    # given [1..5]

    $array->last; # 5

The last method returns the value of the last element in the array. This method
returns a data type object to be determined after execution.

=head2 length

    # given [1..5]

    $array->length; # 5

The length method returns the number of elements in the array. This method
returns a L<Data::Object::Number> object.

=head2 map

    # given [1..5]

    $array->map(sub{
        shift + 1
    });

    # [2,3,4,5,6]

The map method iterates over each element in the array, executing the
code reference supplied in the argument, passing the routine the value at the
current position in the loop and returning a new array reference containing
the elements for which the argument returns a value or non-empty list. This
method returns a L<Data::Object::Array> object.

=head2 max

    # given [8,9,1,2,3,4,5]

    $array->max; # 9

The max method returns the element in the array with the highest numerical
value. All non-numerical element are skipped during the evaluation process. This
method returns a L<Data::Object::Number> object.

=head2 min

    # given [8,9,1,2,3,4,5]

    $array->min; # 1

The min method returns the element in the array with the lowest numerical
value. All non-numerical element are skipped during the evaluation process. This
method returns a L<Data::Object::Number> object.

=head2 none

    # given [2..5]

    $array->none('$a <= 1'); # 1; true
    $array->none('$a <= 2'); # 0; false

The none method returns true if none of the elements in the array meet the
criteria set by the operand and rvalue. This method supports codification, i.e,
takes an argument which can be a codifiable string, a code reference, or a code
data type object. This method returns a L<Data::Object::Number> object.

=head2 nsort

    # given [5,4,3,2,1]

    $array->nsort; # [1,2,3,4,5]

The nsort method returns an array reference containing the values in the array
sorted numerically. This method returns a L<Data::Object::Array> object.

=head2 one

    # given [2..5]

    $array->one('$a == 5'); # 1; true
    $array->one('$a == 6'); # 0; false

The one method returns true if only one of the elements in the array meet the
criteria set by the operand and rvalue. This method supports codification, i.e,
takes an argument which can be a codifiable string, a code reference, or a code
data type object. This method returns a L<Data::Object::Number> object.

=head2 pairs

    # given [1..5]

    $array->pairs; # [[0,1],[1,2],[2,3],[3,4],[4,5]]

The pairs method is an alias to the pairs_array method. This method returns a
L<Data::Object::Array> object. This method is an alias to the pairs_array
method.

=head2 pairs_array

    # given [1..5]

    $array->pairs_array; # [[0,1],[1,2],[2,3],[3,4],[4,5]]

The pairs_array method returns an array reference consisting of array references
where each sub array reference has two elements corresponding to the index and
value of each element in the array. This method returns a L<Data::Object::Array>
object.

=head2 pairs_hash

    # given [1..5]

    $array->pairs_hash; # {0=>1,1=>2,2=>3,3=>4,4=>5}

The pairs_hash method returns a hash reference where each key and value pairs
corresponds to the index and value of each element in the array. This method
returns a L<Data::Object::Hash> object.

=head2 part

    # given [1..10]

    $array->part(sub { shift > 5 }); # [[6, 7, 8, 9, 10], [1, 2, 3, 4, 5]]

The part method iterates over each element in the array, executing the
code reference supplied in the argument, using the result of the code reference
to partition to array into two distinct array references. This method returns
an array reference containing exactly two array references. This method supports
codification, i.e, takes an argument which can be a codifiable string, a code
reference, or a code data type object. This method returns a
L<Data::Object::Array> object.

=head2 pop

    # given [1..5]

    $array->pop; # 5

The pop method returns the last element of the array shortening it by one. Note,
this method modifies the array. This method returns a data type object to be
determined after execution. Note: This method modifies the array.

=head2 push

    # given [1..5]

    $array->push(6,7,8); # [1,2,3,4,5,6,7,8]

The push method appends the array by pushing the agruments onto it and returns
itself. This method returns a data type object to be determined after execution.
Note: This method modifies the array.

=head2 random

    # given [1..5]

    $array->random; # 4

The random method returns a random element from the array. This method returns a
data type object to be determined after execution.

=head2 reverse

    # given [1..5]

    $array->reverse; # [5,4,3,2,1]

The reverse method returns an array reference containing the elements in the
array in reverse order. This method returns a L<Data::Object::Array> object.

=head2 rnsort

    # given [5,4,3,2,1]

    $array->rnsort; # [5,4,3,2,1]

The rnsort method returns an array reference containing the values in the
array sorted numerically in reverse. This method returns a
L<Data::Object::Array> object.

=head2 rotate

    # given [1..5]

    $array->rotate; # [2,3,4,5,1]
    $array->rotate; # [3,4,5,1,2]
    $array->rotate; # [4,5,1,2,3]

The rotate method rotates the elements in the array such that first elements
becomes the last element and the second element becomes the first element each
time this method is called. This method returns a L<Data::Object::Array> object.
Note: This method modifies the array.

=head2 rsort

    # given ['a'..'d']

    $array->rsort; # ['d','c','b','a']

The rsort method returns an array reference containing the values in the array
sorted alphanumerically in reverse. This method returns a L<Data::Object::Array>
object.

=head2 set

    # given [1..5]

    $array->set(4,6); # [1,2,3,4,6]

The set method returns the value of the element in the array at the index
specified by the argument after updating it to the value of the second argument.
This method returns a data type object to be determined after execution. Note:
This method modifies the array.

=head2 shift

    # given [1..5]

    $array->shift; # 1

The shift method returns the first element of the array shortening it by one.
This method returns a data type object to be determined after execution. Note:
This method modifies the array.

=head2 size

    # given [1..5]

    $array->size; # 5

The size method is an alias to the length method. This method returns a
L<Data::Object::Number> object. This method is an alias to the length method.

=head2 slice

    # given [1..5]

    $array->slice(2,4); # [3,5]

The slice method returns an array reference containing the elements in the
array at the index(es) specified in the arguments. This method returns a
L<Data::Object::Array> object.

=head2 sort

    # given ['d','c','b','a']

    $array->sort; # ['a','b','c','d']

The sort method returns an array reference containing the values in the array
sorted alphanumerically. This method returns a L<Data::Object::Array> object.

=head2 sum

    # given [1..5]

    $array->sum; # 15

The sum method returns the sum of all values for all numerical elements in the
array. All non-numerical element are skipped during the evaluation process. This
method returns a L<Data::Object::Number> object.

=head2 tail

    # given [1..5]

    $array->tail; # [2,3,4,5]

The tail method returns an array reference containing the second through the
last elements in the array omitting the first. This method returns a
L<Data::Object::Array> object.

=head2 unique

    # given [1,1,1,1,2,3,1]

    $array->unique; # [1,2,3]

The unique method returns an array reference consisting of the unique elements
in the array. This method returns a L<Data::Object::Array> object.

=head2 unshift

    # given [1..5]

    $array->unshift(-2,-1,0); # [-2,-1,0,1,2,3,4,5]

The unshift method prepends the array by pushing the agruments onto it and
returns itself. This method returns a data type object to be determined after
execution. Note: This method modifies the array.

=head2 values

    # given [1..5]

    $array->values; # [1,2,3,4,5]

The values method returns an array reference consisting of the elements in the
array. This method essentially copies the content of the array into a new
container. This method returns a L<Data::Object::Array> object.

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
