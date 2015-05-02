# godeb

if [ -f /usr/local/sbin/godeb ]; then
  echo 'godeb already installed'
else
  mkdir godeb_temp
  cd godeb_temp
  if [ -f godeb.tar.gz ]; then
    rm -f godeb.tar.gz
  fi
  case "`uname -m`" in
    amd64|x86_64)
      wget 'https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz' -O godeb.tar.gz
      ;;
    i386|i686)
      wget 'https://godeb.s3.amazonaws.com/godeb-386.tar.gz' -O godeb.tar.gz
      ;;
  esac

  tar xvzf godeb.tar.gz
  cp godeb /usr/local/sbin/
  chmod +x /usr/local/sbin/godeb
  cd ../
  rm -rf ./godeb_temp
fi
