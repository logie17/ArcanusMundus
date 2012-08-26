package ArcanusMundus;
use Moose;
use ArcanusMundus::Schema;

has schema => ( is => 'ro', required => 1, lazy => 1, build => '_build_schema' );

sub _build_schema { ArcanusMundus::Schema->connect('dbi:SQLite:share/db/game.db') }

1;
