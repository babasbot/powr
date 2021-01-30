#!/usr/bin/env perl

package Powr;

use strict;
use warnings;

sub new {
  my $class = shift;
  my $raw_output = qx/pmset -g batt/;
  my $self = {raw_output => $raw_output};

  return bless $self, $class;
}

sub raw_output {
  my $self = shift;

  return $self->{raw_output};
}

sub power_source {
  my $self = shift;

  return $1 if ($self->{raw_output} =~ m/Now drawing from '(.*) Power'/);
}

sub battery_percentage {
  my $self = shift;

  return $1 if ($self->{raw_output}=~ m/([0-9]{1,3}%);/);
}

sub status {
  my $self = shift;

  return $1 if ($self->{raw_output}=~ m/((dis)?charging|AC attached);/);
}

1;
