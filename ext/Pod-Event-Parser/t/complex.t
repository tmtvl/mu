use v6;
use Test;
use File::Spec;

plan 3;

use Pod::Event::Parser; pass "(dummy instead of broken use_ok)";
use Pod::Event::Handler::POD; pass "(dummy instead of broken use_ok)";
try { chdir "ext/Pod-Event-Parser" }; # Hack if we're run from make smoke

my $file_path = catfile('lib', 'Pod', 'Event', 'Parser.pm');
my $test_output = "";

# parse the file
parse($file_path, pod2pod($test_output));

# now slurp the file so we can compare it to something
my $expected_output;
my $start = 0;
my $fh = open($file_path);
for =$fh -> $line {
    $start = 1 if $line ~~ rx:perl5/^=pod/;
    if $start { $expected_output ~= "$line\n" }    
    $start = 0 if $line ~~ rx:perl5/^=cut/;    
}
$fh.close();
$expected_output .= chomp;

# now compare
is($test_output, $expected_output, '... Pod::Event::Parser POD round tripped successfully');

