#!/usr/bin/perl -w

# test rounding, accuracy, precicion and fallback, round_mode and mixing
# of classes

use strict;
use Test;

BEGIN
  {
  $| = 1;
  # to locate the testing files
  my $location = $0; $location =~ s/bigfltpm.t//i;
  if ($ENV{PERL_CORE})
    {
    @INC = qw(../lib); 		# testing with the core distribution
    }
  else
    {
    unshift @INC, '../lib';	# for testing manually
    }
  if (-d 't')
    {
    chdir 't';
    require File::Spec;
    unshift @INC, File::Spec->catdir(File::Spec->updir, $location);
    }
  else
    {
    unshift @INC, $location;
    }
  print "# INC = @INC\n";

  plan tests => 428;
  }

use Math::BigInt::Subclass;
use Math::BigFloat::Subclass;

use vars qw/$mbi $mbf/;

$mbi = 'Math::BigInt::Subclass';
$mbf = 'Math::BigFloat::Subclass';

require 'mbimbf.inc';
