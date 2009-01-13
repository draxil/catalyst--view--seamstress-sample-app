package MyApp::View::Seamstress;

use strict;
use base qw(Catalyst::View::Seamstress HTML::Seamstress);
use vars qw($comp_root);

BEGIN {
  # edit this to '/ernest/dev/catalyst-simpleapp/root'
  # or something along those lines... wherever the 
  # HTML for Seamstress to rewrite is.
  $comp_root  = do { my ($appname) = split '::', __PACKAGE__; $appname->config->{root} } ;
  $comp_root .= '/' unless $comp_root =~ m![/]$!;
}

sub comp_root { $comp_root }

__PACKAGE__->config(
  comp_root => $comp_root,
  skeleton  => 'html::skeleton',
  meat_pack => sub { 
    my ($self, $c, $stash, $meat, $skeleton) = @_; 

    my $body_elem = $skeleton->look_down('_tag' => 'body');
    my $meat_body = $skeleton->look_down(seamstress => 'replace');

    unless ($meat_body) {
      warn "could not find meat_body";
      die $meat->as_HTML;
    }

    $meat_body->replace_content($meat->content_list);
  }, # default sub, only runs if skeleton is true
  fixup => sub{},
 ) ;

use lib $comp_root;


1;


=head1 NAME

MyApp::View::Seamstress - Catalyst Seamstress View

=head1 SYNOPSIS

See L<MyApp>

=head1 DESCRIPTION

Catalyst Seamstress View.

=head1 METHODS

=head2 comp_root

This method returns the root of your html file tree which is normally something
like /full/path/to/MyApp/root/


=head1 AUTHOR

metaperl,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
