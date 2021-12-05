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
my @draws = split /,/, $in;

<>;
my @boards = ([]);

while(<>)
{
	chomp;
	s/^\s*//;
	if(!$_)
	{
		push @boards, [];
	}
	$boards[-1] = [$boards[-1]->@*, split / +/, $_ ];
}

sub score
{
	my ($board, $marked, $draw) = @_;
	print Dumper([$board, $marked, $draw]);
	print Dumper([ map { $board->[$_] } grep { !defined($marked->{$_}) } (0 .. 24) ]);
	my $sum = sum map { $board->[$_] } grep { !defined($marked->{$_}) } (0 .. 24);
	say "WIN";
	say $sum;
	say "SOLUTION: ", $sum * $draw;
}

sub check_board
{
	my ($board, @draws) = @_;
	my %marked;
	foreach my $draw (@draws)
	{
		say $draw;
		foreach my $i (0 .. 24)
		{
			$marked{$i} = 1 if $board->[$i] == $draw;
		}
	}

	foreach my $y (0 .. 4)
	{
		my $win = 1;
		foreach my $x (0 .. 4)
		{
			$win &&= defined($marked{ $x + $y * 5 });
		}
		say "Y = $y";
		return score($board, \%marked, $draws[-1]) if($win);
	}
	foreach my $x (0 .. 4)
	{
		my $win = 1;
		foreach my $y (0 .. 4)
		{
			$win &&= defined($marked{ $x + $y * 5 });
		}
		say "X = $x";
		return score($board, \%marked, $draws[-1]) if($win);
	}
}

my %won_boards;
foreach my $i (0 .. $#draws)
{
	say "DRAW: $draws[$i]";
	say "WINS:";
	print Dumper(\%won_boards);
	foreach my $board (0 .. $#boards)
	{
		if(!$won_boards{$board})
		{
			my $win = check_board($boards[$board], @draws[0 .. $i]);
			$won_boards{$board} = 1 if($win);
		}
		if(scalar(keys %won_boards) == scalar(@boards))
		{
			exit;
		}
	}
}

