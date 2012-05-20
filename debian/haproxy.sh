# HAProxy

if dpkg -s "haproxy"; then
  echo "haproxy already installed"
else
  aptitude -y install haproxy
fi
