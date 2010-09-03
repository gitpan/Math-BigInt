#!/usr/bin/perl -w 

# check that simple requiring BigFloat and then bone() works

use strict;
use Test;

BEGIN
  {
  $| = 1;
  # to locate the testing files
  my $location = $0; $location =~ s/req_mbf1.t//i;
  unshift @INC, qw(../lib);     # to locate the modules
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

  plan tests => 1;
  } 

require Math::BigFloat; my $x = Math::BigFloat->bone(); ok ($x,1);

# all tests done

