# perlbrew

if [ -e "$HOME/perl5/perlbrew/etc/bashrc" ]; then                                                                                                                                                       
  echo "perlbrew already installed"
else
  install perlbrew
  wget --no-check-certificate -O - http://install.perlbrew.pl | bash
  yes '' | cpan App::perlbrew
  echo "source $HOME/perl5/perlbrew/etc/bashrc && perlbrew init" | bash
  echo '[[ -s $HOME/perl5/perlbrew/etc/bashrc ]] && source $HOME/perl5/perlbrew/etc/bashrc' >> ~/.bash_profile
fi
