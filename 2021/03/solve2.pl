#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature qw(say signatures);
no warnings "experimental::signatures";
use List::Util qw(min max);

#my @counts;
my @values;
while(<>)
{
	chomp;
	next unless($_);
	push @values, $_;
	#	foreach my $i (0 .. length($_)-1)
	#	{
	#		$counts[$i]->{substr($_, $i, 1)}++;
	#	}
}
#my @most_common = map { $counts[$_]->{0} > $counts[$_]->{1} ? 0 : 1 }  (0 .. scalar(@counts)-1);

my @tmp_vals = (@values);
my $pos = 0;
while(scalar(@tmp_vals) > 1)
{
	my @counts;
	foreach (@tmp_vals)
	{
		foreach my $i (0 .. length($_)-1)
		{
			$counts[$i]->{substr($_, $i, 1)}++;
		}
	}
	my @most_common = map { $counts[$_]->{0} > $counts[$_]->{1} ? 0 : 1 }  (0 .. scalar(@counts)-1);

	@tmp_vals = grep { substr($_, $pos, 1) eq $most_common[$pos] } @tmp_vals;

	print Dumper(\@tmp_vals);
	$pos++;
}
my $oxygen = oct("0b" . $tmp_vals[0]);
say "===";
@tmp_vals = (@values);
$pos = 0;
while(scalar(@tmp_vals) > 1)
{
	my @counts;
	foreach (@tmp_vals)
	{
		foreach my $i (0 .. length($_)-1)
		{
			$counts[$i]->{substr($_, $i, 1)}++;
		}
	}
	my @most_common = map { $counts[$_]->{0} > $counts[$_]->{1} ? 0 : 1 }  (0 .. scalar(@counts)-1);

	@tmp_vals = grep { substr($_, $pos, 1) ne $most_common[$pos] } @tmp_vals;

	print Dumper(\@tmp_vals);
	$pos++;
}
my $co2 = oct("0b" . $tmp_vals[0]);

say $oxygen;
say $co2;
say $oxygen * $co2;

