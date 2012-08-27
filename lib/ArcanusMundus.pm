package ArcanusMundus;
use Moose;
use ArcanusMundus::Game;
use ArcanusMundus::Schema;

has schema => ( is => 'ro', required => 1, lazy => 1, builder => '_build_schema' );

sub _build_schema { ArcanusMundus::Schema->connect('dbi:SQLite:share/db/game.db') }

sub start_game {
  my $self = shift;
  ArcanusMundus::Game->new->run($self->schema);
}

1;
