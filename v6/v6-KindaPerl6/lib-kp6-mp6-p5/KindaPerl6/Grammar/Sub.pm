# Do not edit this file - Generated by MiniPerl6
use v5;
use strict;
use MiniPerl6::Perl5::Runtime;
use MiniPerl6::Perl5::Match;
package KindaPerl6::Grammar;
sub new { shift; bless { @_ }, "KindaPerl6::Grammar" }
sub method_sig { my $grammar = shift; my $List__ = \@_; my $str; my $pos; do {  $str = $List__->[0];  $pos = $List__->[1]; [$str, $pos] }; my  $MATCH; $MATCH = MiniPerl6::Perl5::Match->new( 'str' => $str,'from' => $pos,'to' => $pos,'bool' => 1, ); $MATCH->bool(do { my  $pos1 = $MATCH->to(); (do { (do { my  $m2 = $grammar->opt_ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && ((('(' eq substr($str, $MATCH->to(), 1)) ? (1 + $MATCH->to((1 + $MATCH->to()))) : 0) && (do { my  $m2 = $grammar->opt_ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && (do { my  $m2 = $grammar->sig($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());$MATCH->{'sig'} = $m2;1 } else { 0 } } } && (do { my  $m2 = $grammar->opt_ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && (((')' eq substr($str, $MATCH->to(), 1)) ? (1 + $MATCH->to((1 + $MATCH->to()))) : 0) && do { my  $ret = sub  { my $List__ = \@_; do { [] }; do { return(${$MATCH->{'sig'}}) }; '974^213' }->(); do { if (($ret ne '974^213')) { $MATCH->capture($ret);return($MATCH) } else {  } }; 1 })))))) } || do { $MATCH->to($pos1); do { my  $ret = sub  { my $List__ = \@_; do { [] }; do { return(Sig->new( 'invocant' => Var->new( 'sigil' => '$','twigil' => '','name' => 'self','namespace' => [], ),'positional' => [],'named' => {  }, )) }; '974^213' }->(); do { if (($ret ne '974^213')) { $MATCH->capture($ret);return($MATCH) } else {  } }; 1 } }) }); return($MATCH) };
sub sub_sig { my $grammar = shift; my $List__ = \@_; my $str; my $pos; do {  $str = $List__->[0];  $pos = $List__->[1]; [$str, $pos] }; my  $MATCH; $MATCH = MiniPerl6::Perl5::Match->new( 'str' => $str,'from' => $pos,'to' => $pos,'bool' => 1, ); $MATCH->bool(do { my  $pos1 = $MATCH->to(); (do { (do { my  $m2 = $grammar->opt_ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && ((('(' eq substr($str, $MATCH->to(), 1)) ? (1 + $MATCH->to((1 + $MATCH->to()))) : 0) && (do { my  $m2 = $grammar->opt_ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && (do { my  $m2 = $grammar->sig($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());$MATCH->{'sig'} = $m2;1 } else { 0 } } } && (do { my  $m2 = $grammar->opt_ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && (((')' eq substr($str, $MATCH->to(), 1)) ? (1 + $MATCH->to((1 + $MATCH->to()))) : 0) && do { my  $ret = sub  { my $List__ = \@_; do { [] }; do { return(${$MATCH->{'sig'}}) }; '974^213' }->(); do { if (($ret ne '974^213')) { $MATCH->capture($ret);return($MATCH) } else {  } }; 1 })))))) } || do { $MATCH->to($pos1); do { my  $ret = sub  { my $List__ = \@_; do { [] }; do { return(Sig->new( 'invocant' => (undef),'positional' => [],'named' => {  }, )) }; '974^213' }->(); do { if (($ret ne '974^213')) { $MATCH->capture($ret);return($MATCH) } else {  } }; 1 } }) }); return($MATCH) };
sub sub { my $grammar = shift; my $List__ = \@_; my $str; my $pos; do {  $str = $List__->[0];  $pos = $List__->[1]; [$str, $pos] }; my  $MATCH; $MATCH = MiniPerl6::Perl5::Match->new( 'str' => $str,'from' => $pos,'to' => $pos,'bool' => 1, ); $MATCH->bool(do { my  $pos1 = $MATCH->to(); do { ((('s' eq substr($str, $MATCH->to(), 1)) ? (1 + $MATCH->to((1 + $MATCH->to()))) : 0) && ((('u' eq substr($str, $MATCH->to(), 1)) ? (1 + $MATCH->to((1 + $MATCH->to()))) : 0) && ((('b' eq substr($str, $MATCH->to(), 1)) ? (1 + $MATCH->to((1 + $MATCH->to()))) : 0) && (do { my  $m2 = $grammar->ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && (do { my  $m2 = $grammar->opt_name($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());$MATCH->{'opt_name'} = $m2;1 } else { 0 } } } && (do { my  $m2 = $grammar->opt_ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && (do { my  $m2 = $grammar->sub_sig($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());$MATCH->{'sub_sig'} = $m2;1 } else { 0 } } } && (do { my  $m2 = $grammar->opt_ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && ((('{' eq substr($str, $MATCH->to(), 1)) ? (1 + $MATCH->to((1 + $MATCH->to()))) : 0) && (do { my  $m2 = $grammar->opt_ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && (do { my  $ret = sub  { my $List__ = \@_; do { [] }; do { COMPILER::add_pad() }; '974^213' }->(); do { if (($ret ne '974^213')) { $MATCH->capture($ret);return($MATCH) } else {  } }; 1 } && (do { my  $m2 = $grammar->exp_stmts($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());$MATCH->{'exp_stmts'} = $m2;1 } else { 0 } } } && (do { my  $m2 = $grammar->opt_ws($str, $MATCH->to()); do { if ($m2) { $MATCH->to($m2->to());1 } else { 0 } } } && (do { my  $pos1 = $MATCH->to(); (do { (('}' eq substr($str, $MATCH->to(), 1)) ? (1 + $MATCH->to((1 + $MATCH->to()))) : 0) } || do { $MATCH->to($pos1); do { my  $ret = sub  { my $List__ = \@_; do { [] }; do { Main::say('*** Syntax Error in sub \'', ${$MATCH->{'name'}}, '\''); die('error in Block') }; '974^213' }->(); do { if (($ret ne '974^213')) { $MATCH->capture($ret);return($MATCH) } else {  } }; 1 } }) } && do { my  $ret = sub  { my $List__ = \@_; do { [] }; do { my  $env = $List_COMPILER::PAD->[0]; COMPILER::drop_pad(); my  $block = ${$MATCH->{'exp_stmts'}}; KindaPerl6::Grammar::declare_parameters($env, $block, ${$MATCH->{'sub_sig'}}); return(Sub->new( 'name' => ${$MATCH->{'opt_name'}},'block' => Lit::Code->new( 'pad' => $env,'state' => {  },'sig' => ${$MATCH->{'sub_sig'}},'body' => $block, ), )) }; '974^213' }->(); do { if (($ret ne '974^213')) { $MATCH->capture($ret);return($MATCH) } else {  } }; 1 })))))))))))))) } }); return($MATCH) }


;
1;
