#!/bin/bash

# This script comes with ABSOLUTELY NO WARRANTY, use at own risk
# Copyright (C) 2014 Osiris Alejandro Gomez <osiux@osiux.com.ar>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

apt=$(grep ^deb /etc/apt/sources.list | head -1)
debian_version=$(echo $apt | awk '{print $3}' | cut -d/ -f1)
echo $debian_version

u ()
{
    apt-get update
}

i ()
{
  p=$(dpkg -l $1 | egrep ^ii | awk '{print $2}')
  v=$(dpkg -l $1 | egrep ^ii | awk '{print $3}')
  a=$(apt-cache show $1 | egrep "^Version" | head -1 | awk '{print $2}')

  if [ "$p" = "$1" ]
  then
    printf "%25s\t%-25s\t%-25s\n" $1 $v $a
  else
    case $1 in
      emacs)
        version=${v_emacs[$debian_version]}
        ;;
      *)
        version=$1
    esac

    echo $version ...
    apt-get -qq -y install $version
  fi
}

r ()
{
  apt-get remove $1
}

tty-bak ()
{
  i lzop
  i rdiff
  i rdiff-backup
  i rsync
  i storebackup
  i tardiff
  i xdelta3
}

tty-sudo ()
{
  i sudo
}

tty-python ()
{
  i ipython
  i python-docutils
  i python-setuptools
  i python-sphinx
  i python-virtualenv
  i rst2pdf
}

remove()
{
  r nano
  r python-samba
  r samba
  r samba-common
  r samba-common-bin
  r samba-dsdb-modules
  r samba-libs:amd64
  r samba-vfs-modules
  r vlc-plugin-samba
}

x-util ()
{
  i dmenu
}

list-functions ()
{
  egrep "^[a-z-]+\ \(\)" "$0" | egrep "(x-|tty-)" | tr -d "()" | sort
}

while getopts "adefhlmnoprstuvx" OPTION
do
  case $OPTION in
    a)
      only-tty
      with-x
      ;;
    d)
      tty-db
      ;;
    e)
      tty-emacs
      ;;
    f)
      tty-firm
      ;;
    h)
      list-functions
      ;;
    l)
      tty-latex
      ;;
    m)
      tty-monitor
      ;;
    n)
      tty-network
      ;;
    o)
      tty-sudo
      ;;
    p)
      tty-privacy
      ;;
    r)
      reprap
      ;;
    s)
      tty-lamp
      ;;
    t)
      only-tty
      ;;
    u)
      u
      ;;
    v)
      tty-dev
      ;;
    x)
      with-x
      ;;
    *)
      exit
      ;;
  esac
done

# vim:tabstop=2:softtabstop=2:shiftwidth=2:expandtab
