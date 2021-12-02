#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature qw(say signatures);
no warnings "experimental::signatures";
use List::Util qw(min max sum);

my @window = ();
my $count = 0;
my $last = 0;
while(<>)
{
	@window = (int($_), @window);
	if(scalar(@window) >= 3)
	{
		my $this = sum(@window[0 .. 2]);
		say $this;
		$count++ if($last && $this > $last);
		$last = $this;
		@window = @window[0 .. 2];
	}
	#$count++ if ($last && $_ > $last);
	#$last = int($_);
}
say $count;

