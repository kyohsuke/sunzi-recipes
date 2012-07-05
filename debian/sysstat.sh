# sysstat

if dpkg -s "sysstat"; then
  echo "sysstat already installed"
else
  aptitude -q -y install sysstat
fi
