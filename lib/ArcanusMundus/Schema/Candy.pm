package ArcanusMundus::Schema::Candy;

use strict;
use warnings;
use base 'DBIx::Class::Candy';
use Moose;
 
sub base { $_[1] || 'ArcanusMundus::Schema::Result' }
sub autotable { 1 };

1;
