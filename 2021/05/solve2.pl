#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature qw(say signatures);
no warnings "experimental::signatures";
use List::Util qw(min max);

my %data;

while(<>)
{
	if(/(\d+),(\d+) -> (\d+),(\d+)/)
	{
		my ($x1, $y1, $x2, $y2) = ($1, $2, $3, $4);
		my $len = max(abs($x2 - $x1), abs($y2 - $y1));
		foreach my $d (0 .. $len)
		{
			my $x = $x1 + $d * ( ($x2 - $x1) <=> 0 );
			my $y = $y1 + $d * ( ($y2 - $y1) <=> 0 );
			$data{"$x,$y"}++;
		}
	}

}

print Dumper(\%data);
say scalar(grep { $data{$_} > 1} keys %data);
