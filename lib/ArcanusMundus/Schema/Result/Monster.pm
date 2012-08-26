package ArcanusMundus::Schema::Result::Monster;
use ArcanusMundus::Schema::Candy;
use Moose;

with 'ArcanusMundus::Role::Offense::BasicSword';

primary_column id => { 
  data_type => 'int', 
  is_auto_increment => 1, 
  extra => { unsigned => 1 }, 
};

has_column name => (
  data_type => 'varchar', 
  size => '64',
  is_nullable => 1,
);

1;
