#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature qw(say signatures);
no warnings "experimental::signatures";
use List::Util qw(min max);

my ($x, $y, $aim) = (0,0, 0);
while(<>)
{
	$aim += $1 if(/down (\d+)/);
	$aim -= $1 if(/up (\d+)/);

	($x, $y) = ($x + $1, $y + $aim * $1) if(/forward (\d+)/);
}
say $x*$y;
