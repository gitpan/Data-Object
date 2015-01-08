# A List Data Type Role for Perl 5
package Data::Object::Role::Type::List;

use 5.10.0;
use Moo::Role;

with 'Data::Object::Role::Type::Value';

our $VERSION = '0.04'; # VERSION

requires 'defined';
requires 'grep';
requires 'head';
requires 'join';
requires 'length';
requires 'map';
requires 'reverse';
requires 'sort';
requires 'tail';

1;
