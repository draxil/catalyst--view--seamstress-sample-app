package html::skeleton;

use strict;
use warnings;

use HTML::TreeBuilder;


use base qw(MyApp::View::Seamstress); 

our $tree;

#warn MyApp::View::Seamstress->comp_root(); 
sub new {
  my $file = MyApp::View::Seamstress->comp_root() . 'html/skeleton.html' ;

  -e $file or die "$file does not exist. Therefore cannot load";

  $tree =HTML::TreeBuilder->new;
  $tree->store_declarations;
  $tree->parse_file($file);
  $tree->eof;
  
  bless $tree, __PACKAGE__;
}

sub process {
  my ($self, $c, $stash) = @_;


  $tree;
}

1;
