#!/usr/bin/perl

use strict;
use warnings;

my($wishlist) = do $ARGV[0];

print qq{<table><tr><th>Author</th><th>Title</th><th>ISBN</th></tr>\n\n};
for my $item (@$wishlist) {
    for my $key (qw( author title )) {
        $item->{$key} =~ s/&/&amp;/g;
        $item->{$key} =~ s/</&lt;/g;
        $item->{$key} =~ s/>/&gt;/g;
    }
    print <<EOM;
<tr><td>$item->{author}</td><td>$item->{title}</td><td>$item->{asin}</td><td><a href="https://$ARGV[1]/search~S38?/i$item->{asin}/i$item->{asin}/1%2C1%2C1%2CB/request&FF=i$item->{asin}&1%2C1%2C" title="Request">Request</a></td></tr>
EOM
}
print qq{</table>};
