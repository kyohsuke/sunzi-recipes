# vim73 --- See Also: http://hayajo.tumblr.com/post/10224109760/vim7-3
# $1: patches

pushd /usr/local/src
if test -n "`find / -name vim -type f`"; then
  echo "vim7.3 already installed"
else
  if [ -e vim-7.3.tar.bz2 ]; then
    echo "downloading vim-7.3 --- cached"
  else
    echo "downloading vim-7.3"
    curl -s -O ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
  fi

  # extract file
  tar jxf vim-7.3.tar.bz2

  # download pathces
  echo "downloading patches"
  mkdir -p vim73/patches
  pushd vim73/patches/
  for i in `seq -w $1`; do
    if [ -e "7.3.${i}" ]; then
      echo "downloading patches $i/$1 --- cached"
    else
      echo "downloading patches $i/$1"
      curl -s -O "ftp://ftp.vim.org/pub/vim/patches/7.3/7.3.$i"
    fi
  done
  popd
  echo "applying patches"
  cat `seq -f "patches/7.3.%03g" $1` | patch -p0
  echo "building"
  ./configure --enable-multibyte --disable-netbeans --disable-gui --disable-gtktest --disable-acl --disable-gpm --disable-xim --without-x && make && make test && make install
fi
popd
