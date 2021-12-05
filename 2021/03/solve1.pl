#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature qw(say signatures);
no warnings "experimental::signatures";
use List::Util qw(min max);

my @counts;
while(<>)
{
	chomp;
	next unless($_);
	foreach my $i (0 .. length($_)-1)
	{
		$counts[$i]->{substr($_, $i, 1)}++;
	}
}
print Dumper(\@counts);
my $gamma = oct('0b'. join('', map { $counts[$_]->{0} > $counts[$_]->{1} ? '0' : '1' }  (0 .. scalar(@counts)-1)));
my $epsilon = oct('0b'. join('', map { $counts[$_]->{0} < $counts[$_]->{1} ? '0' : '1' }  (0 .. scalar(@counts)-1)));
say $gamma * $epsilon;
