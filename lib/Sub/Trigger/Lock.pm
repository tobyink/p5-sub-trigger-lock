package Sub::Trigger::Lock;

use 5.008000;
use strict;
use warnings;

use Exporter::Tiny ();
our @ISA = qw(Exporter::Tiny);

our %EXPORT_TAGS = (
	all      => [qw( Lock )],
	default  => [qw( Lock )],
);
our @EXPORT_OK = @{ $EXPORT_TAGS{all} };
our @EXPORT    = @{ $EXPORT_TAGS{default} };

our $AUTHORITY = 'cpan:TOBYINK';
our $VERSION   = '0.001';

require XSLoader;
XSLoader::load('Sub::Trigger::Lock', $VERSION);

sub _generate_Lock {
	my $me   = shift;
	my $func = $me->can('_lock');
	sub { $func };
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Sub::Trigger::Lock - a coderef for use in Moose triggers that will lock hashrefs and arrayrefs

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 BUGS

Please report any bugs to
L<http://rt.cpan.org/Dist/Display.html?Queue=Sub-Trigger-Lock>.

=head1 SEE ALSO

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2013 by Toby Inkster.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.


=head1 DISCLAIMER OF WARRANTIES

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.

