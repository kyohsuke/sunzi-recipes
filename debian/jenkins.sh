# jenkins

if dpkg -s "jenkins"; then
  echo "jenkins already installed"
else
  if ! grep -sq 'squeeze main non-free' /etc/apt/sources.list; then
    perl -i -p -e 's/squeeze main/squeeze main non-free/g' /etc/apt/sources.list
    perl -i -p -e 's/squeeze\/updates main/squeeze\/updates main non-free/g' /etc/apt/sources.list
  fi
  wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
  sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
  aptitude update
  aptitude -q -y install sun-java6-jdk
  aptitude -q -y install jenkins
fi
