package ArcanusMundus;
use Moose;
use ArcanusMundus::Game;
use ArcanusMundus::Schema;
use PocketIO;
use Plack::Builder;

our $VERSION = '0.001';

has schema => ( is => 'ro', required => 1, lazy => 1, builder => '_build_schema' );

sub _build_schema { ArcanusMundus::Schema->connect('dbi:SQLite:share/db/game.db') }

sub start_game {
  my $self = shift;
  ArcanusMundus::Game->new->run($self->schema);
}

sub run {
  builder {
    mount '/map' => PocketIO->new(
      handler => sub {
        my $self = shift;
        $self->on(
          'message' => sub {
            my $self = shift;
            my ($message) = @_;
          }
        );
        $self->send({buffer => []});
      }
    );
  };
}
 
1;
