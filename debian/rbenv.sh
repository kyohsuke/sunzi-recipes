# rbenv

if ! grep -sq 'eval "$(rbenv init -)"'; then
  echo "rbenv already installed"
else
  aptitude update
  aptitude install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev

  # install rbenv
  git clone git://github.com/sstephenson/rbenv.git .rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

  # install ruby-build
  mkdir -p ~/.rbenv/plugins
  cd ~/.rbenv/plugins
  git clone git://github.com/sstephenson/ruby-build.git
fi
