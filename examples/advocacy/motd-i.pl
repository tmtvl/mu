use v6;

unshift @*INC, 'ext/File-Spec/lib', '../ext/File-Spec/lib', '../../ext/File-Spec/lib';

require File::Spec;
my $progdir   = splitpath($*PROGRAM_NAME)[1] || '.';
unshift @*INC, $progdir;
require Motd; 

my $subject   = @*ARGS[0] // 'Pugs is';
my $surveyed  = @*ARGS[1] // 20;
my %tally     ;
my @list      ;
my $dict = canonpath("$progdir/pugspraise");

my $fh = open($dict) orelse die $!;

for $fh.lines -> $line {
    push @list, $line || next()
};

$fh.close;
my $orig      = ~@list;
my $most      = 0;
my &mostsaid := { matchval \$most,\%tally,3};
my &tell      = sub {
     say "{ 
            $subject~report mostsaid() 
        }.{
            "\n" x 10
        }([NewListItem,...] <Enter>)"
};

say "Press Enter to generate quotes about \"$subject...\""~
      "\nPress Ctrl-D to end";

for $*IN.lines -> $keyed {
    clear;
    my @keyed_args;
    if $keyed {
        @keyed_args = parse_args($keyed);
    }
    @list      = (@keyed_args , @list);
    %tally     = whisper_about $surveyed,@list ;
    $most = %tally.values.max;
    tell(mostsaid()); 
    @keyed_args.perl.say;
}

unless $orig eq ~@list {
    say "Do you want to save your changes?";
    print "y/N ..."; 
    my $ans = $*IN.get;

    # User wants to save changes
    # Save the original $dict to a backup
    if $ans eq 'y'|'Y' {
        my $backup = $dict;
        my $incr    = 1;

        while "$backup-$incr" ~~ :f {
            $incr++;
        }

        $backup ~= "-$incr";
        rename $dict,"$backup";

        # Write the changes to a new $dict
        my $newfh = open($dict, :w);
        for @list -> $line {say $newfh,$line}
        $newfh.close;

        # Display the differences
        # between old and new versions
        say "diff -u $backup $dict";
    }
}
