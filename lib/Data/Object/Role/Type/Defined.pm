# A Defined Data Type Role for Perl 5
package Data::Object::Role::Type::Defined;

use 5.10.0;
use Moo::Role;

with 'Data::Object::Role::Type::Item';

our $VERSION = '0.04'; # VERSION

sub defined {
    return 1
}

1;
