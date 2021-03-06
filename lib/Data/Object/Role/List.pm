# A List Data Type Role for Perl 5
package Data::Object::Role::List;

use 5.010;
use Moo::Role;

our $VERSION = '0.12'; # VERSION

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
