#!/usr/bin/perl -w

use strict;

my %convert = (
  'a' => 'e',
  'e' => 'i',
  'i' => 'o',
  'o' => 'u',
  'u' => 'a',
  'b' => 'z',
  'c' => 'b',
  'd' => 'c',
  'f' => 'd',
  'g' => 'f',
  'h' => 'g',
  'j' => 'h',
  'k' => 'j',
  'l' => 'k',
  'm' => 'l',
  'n' => 'm',
  'p' => 'n',
  'q' => 'p',
  'r' => 'q',
  's' => 'r',
  't' => 's',
  'v' => 't',
  'w' => 'v',
  'x' => 'w',
  'y' => 'x',
  'z' => 'y'
);

open INPUT, "< input.txt";
my $char;

while (sysread(INPUT, $char, 1)) {
   if ($char =~ /\w/) {
      my $lowercase = ($char eq lc($char));
      $char = lc($char);
      $char = $convert{$char};
      if (! $lowercase) {
         $char = uc($char);
      }
      print $char;
   } else {
      print $char;
   }
}
close INPUT;
