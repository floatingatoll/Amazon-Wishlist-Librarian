#!/usr/bin/perl

$|=1;

use strict;
use warnings;

my($wishlist) = do $ARGV[0];

my @new_wishlist;

for my $item (@$wishlist) {
    sleep 1;
    use LWP::Simple qw(get);
    my $content = get "http://".$ARGV[1]."/search~S38/?searchtype=i&searcharg=".$item->{asin};
    if ($content =~ /yourEntryWouldBeHere/) {
        # warn "# not in catalog:  ".$item->{asin}."  ".$item->{title}."\n";
        next;
    }
    if ($content =~ /Permanent link for this record: (http:[^<]+)</) {
        # warn "# found item link: ".$item->{asin}."  ".$item->{title}."\n";
        $item->{bibRecordLink} = $1;
        push @new_wishlist, $item;
        next;
    }
    warn "# unknown error:   ".$item->{asin}."  ".$item->{title}."\n";
}

use Data::Dumper;

warn "# Found ".scalar(@new_wishlist)." items out of ".scalar(@$wishlist)."\n";

print Dumper \@new_wishlist;
