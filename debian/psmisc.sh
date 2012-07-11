# psmisc (a.k.a pstree)

if dpkg -s "psmisc"; then
  echo "psmisc already installed"
else
  aptitude -y install psmisc
fi
