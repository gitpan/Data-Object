# A Collection Data Type Role for Perl 5
package Data::Object::Role::Type::Collection;

use 5.10.0;
use Moo::Role;

with 'Data::Object::Role::Type::Item';

our $VERSION = '0.04'; # VERSION

requires 'defined';
requires 'each';
requires 'each_key';
requires 'each_n_values';
requires 'each_value';
requires 'exists';
requires 'iterator';
requires 'list';
requires 'keys';
requires 'get';
requires 'set';
requires 'values';

1;
