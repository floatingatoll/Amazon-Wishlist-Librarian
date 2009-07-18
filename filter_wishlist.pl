#!/usr/bin/perl

use strict;
use warnings;

my $wishlist = do $ARGV[0];

my @new_wishlist;

for my $item (@$wishlist) {
    next unless $item->{asin} =~ /^\d{10}$/;
    next unless $item->{priority} eq 'medium';
    push @new_wishlist, $item;
}

use Data::Dumper;

warn "# Kept ".scalar(@new_wishlist)." items out of ".scalar(@$wishlist)."\n";

print Dumper @new_wishlist;
