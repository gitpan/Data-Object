# A Defined Data Type Role for Perl 5
package Data::Object::Role::Defined;

use 5.010;
use Moo::Role;

our $VERSION = '0.12'; # VERSION

sub defined {
    return 1
}

1;
