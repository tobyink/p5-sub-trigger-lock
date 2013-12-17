=pod

=encoding utf-8

=head1 PURPOSE

Test that Sub::Trigger::Lock works.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2013 by Toby Inkster.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.


=cut

use strict;
use warnings;
use Test::More;
use Test::Fatal;

use Sub::Trigger::Lock;

my $code = Lock;

my $h = { foo => 1, quux => [666] };
$h->{bar} = 2;

$code->(undef, $h);

like(
	exception { $h->{baz} = 1 },
	qr/^Attempt to access disallowed key/,
	'error trying to add hash key'
);

{
	local $TODO = "SvREADONLY is too shallow";
	like(
		exception { delete($h->{bar}) },
		qr/^Monkey nuts/,
		'error trying to remove hash key'
	);
	ok(
		exception { $h->{bar} = 1 },
		qr/^Monkey nuts/,
		'error trying to change value for existing hash key'
	);
	ok(
		exception { $h->{quux} = [] },
		qr/^Monkey nuts/,
		'error trying to change arrayref value for existing hash key'
	);
}

is(
	exception { @{$h->{quux}} = (); push @{$h->{quux}}, 42 },
	undef,
	'... but can alter the array referred to by the arrayred'
);

done_testing;

