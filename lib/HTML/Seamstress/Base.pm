package HTML::Seamstress::Base;

use base qw(HTML::Seamstress);

use vars qw($comp_root);

BEGIN {
  $comp_root = "/ernest/dev/catalyst-simpleapp/MyApp/root/"; # IMPORTANT: last character must be "/"
}

use lib $comp_root;

sub comp_root { $comp_root }

1;
