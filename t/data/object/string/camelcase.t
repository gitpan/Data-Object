use Test::More;

use_ok 'Data::Object::String';
can_ok 'Data::Object::String', 'camelcase';

use Scalar::Util 'refaddr';

subtest 'test the camelcase method' => sub {
    my $string = Data::Object::String->new('hello world');
    my $camelcased = $string->camelcase;

    is refaddr($string), refaddr($camelcased);
    is $camelcased->value, 'HelloWorld'; # HelloWorld

    isa_ok $string, 'Data::Object::String';

    $string = Data::Object::String->new('HELLO WORLD');
    $camelcased = $string->camelcase;

    is refaddr($string), refaddr($camelcased);
    is $camelcased->value, 'HelloWorld'; # HelloWorld

    isa_ok $string, 'Data::Object::String';
};

ok 1 and done_testing;
