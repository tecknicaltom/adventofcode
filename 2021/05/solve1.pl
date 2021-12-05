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
		next if($x1 != $x2 && $y1 != $y2);
		foreach my $x (min($x1, $x2) .. max($x1, $x2))
		{
			foreach my $y (min($y1, $y2) .. max($y1, $y2))
			{
				$data{"$x,$y"}++;
			}
		}
	}

}

print Dumper(\%data);
say scalar(grep { $data{$_} > 1} keys %data);
