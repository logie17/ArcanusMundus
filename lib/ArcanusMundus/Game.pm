package ArcanusMundus::Game;
use Moose;

has map_height    => ( is => 'ro', required => 1, default => 100 );
has map_width     => ( is => 'ro', required => 1, default => 100 );
has monster_count => ( is => 'ro', required => 1, default => 10 );

sub initialize {
  my ($class, $schema) = @_;
  #$schema->resultset('Monster')->spawn($self->monster_count);
}

sub run {
  my ($self, $schema) = @_;
}

__PACKAGE__->meta->make_immutable;
