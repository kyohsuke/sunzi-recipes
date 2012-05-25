# innotop

if dpkg -s "innotop"; then
  echo "innotop already installed"
else
  aptitude -q -y install libterm-readkey-perl innotop
fi
