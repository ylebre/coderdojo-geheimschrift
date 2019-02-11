#!/usr/bin/perl -w

use strict;

my @sequence = (1,2,3,5,7);
#my @sequence = (1);

my $max = @sequence;
print "Max: $max\n";

#a = 97
#z = 122

my $offset = 0;
my $counter = 0;

my $input;
my $output;

open INPUT, "< input.txt";
open OUTPUT, "> output.txt";

my $char;

while (sysread(INPUT, $char, 1)) {
   if ($char =~ /\w/) {
      my $lowercase = ($char eq (lc($char)));
      $offset += $sequence[$counter];

      $char = lc($char);
      while ($offset > 26) {
         $offset -= 26;
      }

      $counter++;
      if ($counter == $max) {
         $counter = 0;
      }

      my $charnum = ord($char);
      $charnum += $offset;
      while ($charnum > 122) {
         $charnum -= 26;
      }
      $char = chr($charnum);

      if (! $lowercase) {
         $char = uc($char);
      }
      print OUTPUT $char;
   } else {
      print OUTPUT $char;
   }
}
close INPUT;
close OUTPUT;