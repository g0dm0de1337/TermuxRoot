To emulate termux inside termux, Use the first version of termux-proot.
____

# Download the file of 1st version of termux-proot
curl -sLo ~/termux-proot.sh https://github.com/Yonle/termux-proot/raw/v1.0.0/termux

# Change permission
chmod +x ~/termux-proot.sh

# Start sandbox
~/termux-proot.sh

____
# Up
apt-get update -y && apt-get upgrade -y && pkg up -y
____
# Install
pkg install neofetch -y && pkg install git -y && pkg install proot -y
____
# Install2
pkg install unzip -y && pkg install fish -y && pkg install curl
____

# Download
curl -sLO git.io/termux-proot.sh
____
# Permission
chmod +x termux-proot.sh
____
# Will setup by itself & start sandboxed environment
./termux-proot.sh

____
# Up2
apt-get update -y && apt-get upgrade -y && pkg up -y
____
# InstallInEmu
pkg install neofetch -y && pkg install git -y && pkg install proot -y
____
# InstallInEmu2
pkg install unzip -y && pkg install fish -y && pkg install curl
____
______

# TermuxRoot
git clone https://github.com/g0dm0de1337/TermuxRoot.git
____
cd TermuxRoot && chmod +x * && cd intro && chmod +x * && cd
____
cd TermuxRoot && bash main
(Copies the command that appears to you as the last step)
_____
# Reboot TermuxEmu
### root
## the next command
### fish

DEV:
### cd /data/data/com.termux/files/usr/etc/ && mv motd /data/data/com.termux/files/usr/ && cd
And
### curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish









