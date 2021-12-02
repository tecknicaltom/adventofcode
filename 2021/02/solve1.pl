#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature qw(say signatures);
no warnings "experimental::signatures";
use List::Util qw(min max);

my ($x, $y) = (0,0);
while(<>)
{
	$x += $1 if(/forward (\d+)/);
	$y += $1 if(/down (\d+)/);
	$y -= $1 if(/up (\d+)/);
}
say $x*$y;
