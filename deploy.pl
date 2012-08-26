#! /usr/bin/env perl

use strict;
use warnings;
use ArcanusMundus::Schema;

my $schema = ArcanusMundus::Schema->connect('dbi:SQLite:share/db/game.db');
$schema->deploy;

