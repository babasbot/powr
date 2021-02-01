#!/usr/bin/env perl

package PowrFormatter;

use strict;
use utf8;
use warnings;

sub new {
  my ($class, $args) = @_;

  my $self = {powr => $args->{powr}};

  return bless $self, $class;
}

sub power_source {
  my $self = shift;
  my $powr = $self->{powr};

  my $source = $powr->power_source;

  if ($source eq 'AC') {
    return "\N{U+26A1}"; # high voltage emoji
  } elsif ($source eq 'Battery') {
    return "\N{U+1F50B}"; # battery emoji
  } else {
    return '';
  }
}

sub status {
  my $self = shift;
  my $powr = $self->{powr};

  my $powr_status = $powr->status;

  if ($powr_status eq 'AC attached') {
    return '~';
  } elsif ($powr_status eq 'discharging') {
    return '▼';
  } elsif ($powr_status eq 'charging') {
    return '▲';
  } else {
    return '';
  }
}

sub short {
  my $self = shift;
  my $powr = $self->{powr};

  return
    $self->status . " " . $powr->battery_percentage . " " . $self->power_source;
}

1;
