#!/usr/bin/perl

use strict;
use warnings;

use WWW::Amazon::Wishlist qw(get_list);

my(@wishlist) = get_list($ARGV[0]); # amazon wishlist ID

use Data::Dumper;

print Dumper \@wishlist;
