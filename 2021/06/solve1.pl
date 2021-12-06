#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature qw(say signatures);
no warnings "experimental::signatures";
use List::Util qw(min max);

my $in = <>;
chomp $in;
my @fish = split /,/, $in;

say "Initial state: ", join(",", @fish);

foreach my $day (1 .. 80)
{
	foreach my $fish_i (0 .. $#fish)
	{
		$fish[$fish_i]--;
		if($fish[$fish_i] == -1)
		{
			push @fish, 8;
			$fish[$fish_i] = 6;
		}

	}
	printf "After %2d days: %s\n", $day, join(",", @fish);
}
say scalar(@fish);
