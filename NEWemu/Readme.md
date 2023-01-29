To emulate termux inside termux, Use the first version of termux-proot.
____

# Download the first Emulator (proot,small)
curl -sLo ~/termux-proot.sh https://github.com/Yonle/termux-proot/raw/v1.0.0/termux

# Change permission
chmod +x ~/termux-proot.sh

# Start sandbox
~/termux-proot.sh
____

# Up
apt-get update -y && apt-get upgrade -y && pkg up -y
____
____
____
____

# Download
curl -sLO git.io/termux-proot.sh
____
# Permission
chmod +x termux-proot.sh
____
# Will setup by itself & start sandboxed environment
~/termux-proot.sh

____
# Up2
apt-get update -y && apt-get upgrade -y && pkg up -y
____
______
_____
____
_____

# TermuxRoot <--SecondEmulator (docker,big)
> •git clone https://github.com/g0dm0de1337/TermuxRoot.git
> •cd TermuxRoot/NEWemu
> •chmod +x TermuxEmu.sh
> •~/TermuxEmu.sh
_____
# Reboot TermuxEmu








