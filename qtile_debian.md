# Howto Install qtile on debian

Install debian without any graphic environment or window tiling manager

## Dependencies tasks
1. Install and configure sudo

```console
:~# apt install sudo
:~# adduser username sudo
```

2. Install git

```console
:~$ sudo apt install git
```

3. Configure user dirs

```console
:~$ xdg-user-dirs-update
```

## Install graphic server Xorg

```console
sudo apt install xorg xterm
```
* xorg: graphic server
* xterm: default graphic termininal used by xorg

### Verify graphic server start it
```console
startx
```

## Install Qtile dependencies
```console
sudo apt install python3 python3-pip python3-venv python3-v-sim python3-debus-dev python3-cffi python3-xcffib python3-cairocffi libpangocairo-1.0-0 libxkbcommon-dev libxkbcommon-x11-dev dmenu alacritty
```

## Create local src folders
```console
:~$ mkdir -p ~/./local/src
:~$ cd .local/src
:~/.local/src$ python3 -m venv qtile-venv
```
In this step the python virtual environment is created

## Clone Qtile git repository
```console
:~/.local/src$ cd qtile-venv
:~/.local/src/qtile-venv$ git clone https://github.com/qtile/qtile.git
:~/.local/src/qtile-venv$ bin/pip install psutil
:~/.local/src/qtile-venv$ bin/pip install qtile/.
```
The Qtile has been cloned from git repository and installed under the qtile folder
it is important install psutil it is a widget requirement for libqtile.widget.net

## Copy Qtile executable
```console
:~/.local/src/qtile-venv$ cd /qtile/bin
:~/.local/src/qtile-venv/qtile/bin$ sudo cp ./qtile /usr/local/bin/
```

## Create/modify .xinitrc
```console
:~/.local/src/qtile-venv/qtile/bin$ cd
:~$ echo "qtile start" >> .xinitrc
```

## Start graphic server
```console
:~$ startx
```
If everthing is ok, the qtile it is working.

## Install and configure lightdm
```console
:~$ sudo apt install lightdm lightdm-gtk-greeter
:~$ cd /usr/share/xsessions/
:/usr/share/xsessions/$ sudo vim qtile.desktop
[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Exec=qtile start
Type=Application
Keywords=wm;tiling

## save and exit :wq
```
