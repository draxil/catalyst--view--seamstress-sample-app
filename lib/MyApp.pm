package MyApp;

use strict;
use warnings;

#
# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
# Static::Simple: will serve static files from the applications root directory
#
use Catalyst qw/-Debug Static::Simple/;

our $VERSION = '0.01';

#
# Configure the application
#
__PACKAGE__->config( name      => 'MyApp' );
__PACKAGE__->config( comp_root => 'x/y/z' );

#
# Start the application
#
__PACKAGE__->setup;

=head1 NAME

MyApp - Catalyst based application

=head1 SYNOPSIS

    script/myapp_server.pl

=head1 DESCRIPTION

Catalyst based application.

=head1 METHODS

=head2 default

=cut

#
# Output a friendly welcome message
#
sub default : Private {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->body( $c->welcome_message );
}

sub message : Global {
    my ( $self, $c ) = @_;

    # Hello World
    $c->stash->{LOOM} = 'html::hello_world';
    $c->stash->{name}     = 'The Heckler';
    $c->stash->{date}     = 'Data Date Datum';
    $c->forward('MyApp::View::Seamstress');
}

#
# Uncomment and modify this end action after adding a View component
#
#=head2 end
#
#=cut
#
#sub end : Private {
#    my ( $self, $c ) = @_;
#
#    # Forward to View unless response body is already defined
#    $c->forward( $c->view('') ) unless $c->response->body;
#}

=head1 AUTHOR

metaperl,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
