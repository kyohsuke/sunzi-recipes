# Percona Server with XtraDB 5.5

if dpkg -s "percona-server-server-5.5"; then
  echo "XtraDB already installed"
else
  if [ ! -f /etc/apt/sources.list.d/percona.list ]; then
    echo 'deb http://repo.percona.com/apt squeeze main'      > /etc/apt/sources.list.d/percona.list
    echo 'deb-src http://repo.percona.com/apt squeeze main' >> /etc/apt/sources.list.d/percona.list
  fi

  gpg --keyserver  hkp://keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
  gpg -a --export CD2EFD2A | apt-key add -
  aptitude update
  aptitude -q -y install percona-server-server-5.5 percona-server-client-5.5 libmysqlclient18 libmysqlclient18-dev
fi
