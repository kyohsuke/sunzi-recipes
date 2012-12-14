# miruo

if [ -f /usr/local/sbin/miruo ]; then
  echo 'mirul already installed'
else
  mkdir miruo_build_temp
  cd miruo_build_temp
  aptitude -y install libpcap0.8-dev
  wget 'http://downloads.sourceforge.net/project/miruo/miruo-0.9.3.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fmiruo%2Ffiles%2F&ts=1342944918&use_mirror=jaist' -O miruo-0.9.3.tar.gz
  tar xvzf miruo-0.9.3.tar.gz
  cd miruo-0.9.3
  ./configure && make && make install
  cd ../../
  rm -rf ./miruo_build_temp
fi
