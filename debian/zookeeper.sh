# zookeeper

if dpkg -s "hadoop-zookeeper-server"; then
  echo "zookeeper already installed"
else
  if ! grep -sq 'squeeze main contrib non-free' /etc/apt/sources.list; then
    perl -i -p -e 's/squeeze main/squeeze main contrib non-free/g' /etc/apt/sources.list
    perl -i -p -e 's/squeeze\/updates main/squeeze\/updates contrib main non-free/g' /etc/apt/sources.list
  fi
  if [ ! -f /etc/apt/sources.list.d/cloudera.list ]; then
    echo 'deb http://archive.cloudera.com/debian squeeze-cdh3 contrib'      > /etc/apt/sources.list.d/cloudera.list
    echo 'deb-src http://archive.cloudera.com/debian squeeze-cdh3 contrib' >> /etc/apt/sources.list.d/cloudera.list
    wget -O - http://archive.cloudera.com/debian/archive.key | apt-key add -
  fi
  aptitude update
  aptitude -q -y install hadoop-zookeeper-server sun-java6-jdk
fi
