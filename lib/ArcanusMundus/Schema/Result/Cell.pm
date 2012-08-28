package ArcanusMundus::Schema::Result::Cell;
use ArcanusMundus::Schema::Candy;
use Moose;

primary_column id => { 
  data_type => 'int', 
  is_auto_increment => 1, 
  extra => { unsigned => 1 }, 
};

has_column x => (
  data_type => 'int', 
  extra => { unsigned => 1 }, 
);

has_column y => (
  data_type => 'int', 
  extra => { unsigned => 1 }, 
);

has_column map_id => (
  data_type => 'int', 
  extra => { unsigned => 1 }, 
);

has_one 'cell_type', 'ArcanusMundus::Schema::Result::CellType', 'cell_id';
belongs_to 'map', 'ArcanusMundus::Schema::Result::Map', 'map_id';
1;
