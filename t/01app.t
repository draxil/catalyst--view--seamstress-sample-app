use Test::More tests => 2;
BEGIN { use_ok( Catalyst::Test, 'MyApp' ); }

ok( request('/')->is_success );
