#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature qw(say signatures);
no warnings "experimental::signatures";
use List::Util qw(min max);

my $last = 0;
my $count = 0;
while(<>)
{
	$count++ if ($last && $_ > $last);
	$last = int($_);
}
say $count;

