package COMPILER;
use Data::Dumper;

# --- Perl 6 / Perl 5 bridge

    our @EXPORT = qw(
        emit_perl6 env_init add_pad inner_pad
        drop_pad put_pad current_pad
        begin_block check_block get_var
    );
    ${"COMPILER::Code_$_"} = \&{"COMPILER::$_"} for @EXPORT;
    sub init_global {
        for ( @EXPORT ) {
            ${"COMPILER::Code_$_"} = ::DISPATCH( $::Code, 'new',
                    {   code => ${"COMPILER::Code_$_"},
                        ast  => bless {
                                    namespace => [ 'COMPILER', ],
                                    name      => $_,
                                    twigil    => '',
                                    sigil     => '&',
                                }, 'Var',
                    },
                );
        }
    }

# --- /bridge


sub emit_perl6 {
    # param = AST
    my $perl6 = $_[0]->emit( );# $visitor_emit_perl6  );
    return $perl6;
}

sub env_init {
    @COMPILER::PAD = (Pad->new(
        outer     => undef,
        lexicals  => [ ],
        namespace => 'Main',
    ));
    $List_COMPILER::PAD = \@COMPILER::PAD;   # for mp6 compatibility
}

sub add_pad {
    #print "add_pad\n";
    unshift @COMPILER::PAD, Pad->new(
        outer     => $COMPILER::PAD[0],
        lexicals  => [ ],
        namespace => $_[0],  # optional
    );
}
sub inner_pad {
    return Pad->new(
        outer     => $_[0],
        lexicals  => [ ],
    );
}

sub drop_pad {
    #print "drop_pad\n";
    shift @COMPILER::PAD;
}

sub put_pad {
    #print "put_pad\n";
    unshift @COMPILER::PAD, $_[0];
}

sub current_pad {
    $COMPILER::PAD[0];
}

#    $PAD[0]->add_lexicals( [ $decl ] );
#    $PAD[0]->eval( $p5_source );

sub begin_block {
    Pad::begin_block( @_ );
}

sub check_block {
    # this routine saves check-blocks, in order to execute the code at the end of compilation

    my $ast = $_[0];
    my $pad = $COMPILER::PAD[0];
    #print "CHECK saved\n";
    push @COMPILER::CHECK, [ $ast, $pad ];
    return Val::Undef->new();
}

sub get_var {
    # this routine is called each time a variable is parsed.
    # it checks for proper pre-declaration
    my $var = shift;
    my $decl = $COMPILER::PAD[0]->declaration( $var );
    #print "COMPILER::get_var: @_ --> $decl\n";
    # TODO - annotate the variable with: Type, declarator
    return $var;
}

{
    COMPILER::init_global;   # export structures to Perl 6
    COMPILER::env_init();    # create the PAD stack
}


1;


=begin

=head1 AUTHORS

The Pugs Team E<lt>perl6-compiler@perl.orgE<gt>.

=head1 SEE ALSO

The Perl 6 homepage at L<http://dev.perl.org/perl6>.

The Pugs homepage at L<http://pugscode.org/>.

=head1 COPYRIGHT

Copyright 2007 by Flavio Soibelmann Glock and others.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=end
