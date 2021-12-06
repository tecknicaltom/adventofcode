#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature qw(say signatures);
no warnings "experimental::signatures";
use List::Util qw(min max sum);

my $in = <>;
chomp $in;
my @fish = split /,/, $in;
my %fish_per_ct;
foreach my $f (@fish)
{
	$fish_per_ct{$f}++;
}

say "Initial state: ", join(",", @fish);

foreach my $day (1 .. 256)
{
	my %next_state;
	foreach my $i (keys %fish_per_ct)
	{
		if($i == 0)
		{
			$next_state{6} += $fish_per_ct{$i};
			$next_state{8} += $fish_per_ct{$i};
		}
		else
		{
			$next_state{$i-1} += $fish_per_ct{$i};
		}
	}
	%fish_per_ct = %next_state;
	printf "After %2d days: %d\n", $day, sum(values %fish_per_ct);
}
#say scalar(@fish);

