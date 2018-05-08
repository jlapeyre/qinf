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
    # this defines a macro, so it needs to be tex-legal
    if(/name=\"Name\"\s+value=\"([^\"]+)/){
	$entry = $1;
	$entry =~ s/\s//g; # remove whitespace
	$entry =~ s/\%/percent/g;
	$entry =~ s/\!/bang/g;
	$entry =~ s/\*/star/g;
	$entry =~ s/\:/colon/g;
	$entry =~ s/\'/quote/g;
	$entry =~ s/\#/sharp/g;
	$entry =~ s/\^/caret/g;
	$entry =~ s/\+/plus/g;
	$entry =~ s/\-/minus/g;
	$entry =~ s/\./dot/g;
	$entry =~ s/\//slash/g;
	$entry =~ s/\?/question/g;
	$entry =~ s/\[/opensquare/g;
	$entry =~ s/\]/closesquare/g;
	$entry =~ s/\{/curly/g;
	$entry =~ s/\|/pipe/g;
	$entry =~ s/\=/equal/g;
	$entry =~ s/\~/twiddle/g;
	$entry =~ s/\&/amp/g;
	$entry =~ s/\;/semicolon/g;
	$entry =~ s/\_/U/g;
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
