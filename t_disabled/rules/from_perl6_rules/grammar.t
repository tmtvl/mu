#!/usr/bin/pugs

use v6;
use Test;

=pod

This file was derived from the perl5 CPAN module Perl6::Rules,
version 0.3 (12 Apr 2004), file t/grammar.t.

It has (hopefully) been, and should continue to be, updated to
be valid perl6.

=cut

plan 18;

if(eval('!("a" ~~ /a/)')) {
  skip_rest "skipped tests - rules support appears to be missing";
} else {

# PGE doesn't parse non-capturing subrules.
# So the real test grammar parsefails.
# This modified grammar breaks some tests below.
my $workaround = 1;
skip "PGE doesn't parse non-capturing subrules.  Parsefails.";
#ok !$workaround,"Defining rule with non-capturing subrule without parsefail.";
if $workaround {eval '
grammar Other {
	rule abc { a (<bee>) c }  # avoid parsefail

	rule bee { b }

	rule def { d <eh> f }

	rule eh  { e }
}
'} else {eval '
grammar Other {
	rule abc { a (<?bee>) c }

	rule bee { b }

	rule def { d <eh> f }

	rule eh  { e }
}
'}

rule bee { B }

ok('abc' ~~ m/^ (<?Other.abc>) $/, '<?Other.abc>', :todo<feature>);
is($/, "abc", 'abc $/', :todo<feature>);
is($0, "abc", 'abc $0', :todo<feature>);

ok('abc' ~~ m/ (<?Other.bee>) /, '<?Other.bee>', :todo<feature>);
is($/, "b", 'bee $/', :todo<feature>);
is($0, "b", 'bee $0', :todo<feature>);

ok('def' ~~ m/^ (<?Other.def>) $/, '(<?Other.def>)', :todo<feature>);
is($/, "def", 'def $/', :todo<feature>);
is($0, "def", 'def $0', :todo<feature>);

ok('def' ~~ m/^ <Other.def> $/, '<Other.def>', :todo<feature>);
is($/, "def", '?def $/', :todo<feature>);
ok($0 ne "def", '?def $0');
is($/<def>, "def", '?def $/<def>', :todo<feature>);
eval_is('$/<def><eh>', "e", '?def $/<def><eh>', :todo<feature>);

ok(!( 'abc' ~~ m/ (<?bee>) / ), '<?bee>');

ok(!eval(q{ 'abc' ~~ m/ (<?Other.sea>) / }), '<?Other.sea>');
ok($!, 'Error', :todo<feature>);

}

