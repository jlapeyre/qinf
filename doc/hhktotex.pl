#!/usr/bin/perl

=pod
 Convert file index.hhk to a list of tex macros to make links into
 the manual

  eg
  hhktotex.pl < index.hhk > man_index.tex
  hhktotex.pl < contents.hhc > man_contents.tex

=cut
1;


while(<>) {
    # Link
    if(/name=\"Local\"\s+value=\"([^\"]+)/){ 
	$link = $1;
        $link =~ s/\#/\\#/g; # latex to ps needs this
#	print "$link\n";
    }
    # name of section
    if(/name=\"Name\"\s+value=\"([^\"]+)/){
	$entry = $1;
	$entry =~ s/\s//g; # remove whitespace
	$entry =~ s/\%/\\%/g;
	$entry =~ s/\!/\\!/g;
	$entry =~ s/\*/\\*/g;
	$entry =~ s/\:/\\:/g;
	$entry =~ s/\'/\\'/g;
	$entry =~ s/\#/\\#/g;
	$entry =~ s/\^/\\^/g;
	$entry =~ s/\_//g; # should replace with legal char
	$entry =~ s/1/one/g;
	$entry =~ s/2/two/g;
	$entry =~ s/3/three/g;
	$entry =~ s/4/four/g;
	$entry =~ s/5/five/g;
	$entry =~ s/6/six/g;
	$entry =~ s/7/seven/g;
	$entry =~ s/8/eight/g;
	$entry =~ s/9/nine/g;
	$entry =~ s/0/zero/g;
	print('\def\maxima' . $entry . '{' . $link . '}', "\n");
    }
}
