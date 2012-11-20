# UFW (Uncomplicated firewall)

if dpkg -s "ufw"; then
  echo "ufw already installed"
else
  aptitude -y install ufw
fi
