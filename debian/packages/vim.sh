# Vim

if dpkg -s "vim"; then
  echo "vim already installed"
else
  aptitude -y install vim vim-common vim-runtiime vim-perl vim-ruby vim-python
fi
