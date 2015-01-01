# A Value Data Type Role for Perl 5
package Data::Object::Role::Values;

use 5.010;
use Moo::Role;

with 'Data::Object::Role::Defined';

our $VERSION = '0.10'; # VERSION

requires 'list';
requires 'values';

1;
