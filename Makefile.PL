use inc::Module::Install;

name('MyApp');
abstract('Catalyst Application');
author('metaperl,,,');
version_from('lib/MyApp.pm');
license('perl');

include('ExtUtils::AutoInstall');

requires( 
  Catalyst => '5.60',
  Catalyst::View::Seamstress => '0'
     );

catalyst_files();

install_script( glob('script/*.pl') );
auto_install();
&WriteAll;
