package html::hello_world;

use strict;
use warnings;

use HTML::TreeBuilder;

use lib '/ernest/dev/catalyst-simpleapp/MyApp/root/html/../../lib';
use base qw(MyApp::View::Seamstress); 

our $tree;

#warn MyApp::View::Seamstress->comp_root(); 
sub new {
  my $file = MyApp::View::Seamstress->comp_root() . 'html/hello_world.html' ;

  -e $file or die "$file does not exist. Therefore cannot load";

  $tree =HTML::TreeBuilder->new;
  $tree->store_declarations;
  $tree->parse_file($file);
  $tree->eof;
  
  bless $tree, __PACKAGE__;
}

sub process {
  my ($self, $c, $stash) = @_;

  use Data::Dumper;
  warn "data: " . Dumper(\@_);

  $tree->look_down(id => $_)->replace_content($stash->{$_})
      for qw(name date);

  $tree;
}

1;
