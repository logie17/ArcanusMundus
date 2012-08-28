package ArcanusMundus::Schema::Result::Map;
use ArcanusMundus::Schema::Candy;
use Moose;

primary_column id => { 
  data_type => 'int', 
  is_auto_increment => 1, 
  extra => { unsigned => 1 }, 
};

has_column height => (
  data_type => 'int', 
  extra => { unsigned => 1 }, 
);

has_column width => (
  data_type => 'int', 
  extra => { unsigned => 1 }, 
);

has_many 'cells', 'ArcanusMundus::Schema::Result::Cell', 'map_id';
1;
