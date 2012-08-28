package ArcanusMundus::Schema::Result::CellType;
use ArcanusMundus::Schema::Candy;
use Moose;

primary_column id => { 
  data_type => 'int', 
  is_auto_increment => 1, 
  extra => { unsigned => 1 }, 
};

has_column type => (
  data_type => 'varchar', 
  size => '64',
);

has_column cell_id => (
  data_type => 'int', 
  extra => { unsigned => 1 }, 
);

belongs_to 'cell', 'ArcanusMundus::Schema::Result::Cell', 'cell_id';
1;
