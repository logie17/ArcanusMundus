package ArcanusMundus::Schema::ResultSet::Monster;
use base 'ArcanusMundus::Schema::ResultSet';
use strict;
use warnings;

sub spawn {
  my ( $self, $monster_count) = @_;

  my $monster_live_count = $self->search(
    undef,
    {
      select => [
        { count => { distinct => 'name' } }
      ],
      as => ['count']
    }
  )->count;

  while ( ($monster_live_count++) < $monster_count ) {
      my $monster = $self->create({name => 'foo'})->insert;
  }
}

1;
