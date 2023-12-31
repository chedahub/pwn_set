#!/bin/bash
export LC_CTYPE=en_US.UTF-8
export LC_ALL=C.UTF-8
source ~/.bashrc

cd ~
sudo apt update -y
sudo apt-get update -y

# vim
sudo apt-get install vim -y

# git
sudo apt-get install git -y

# gdb, gcc
sudo apt-get install gdb -y
sudo apt-get install gcc -y
sudo apt-get install gcc-multilib g++-multilib -y
echo "set disassembly-flavor intel" >> ~/.gdbinit

# netcat
sudo apt-get install netcat -y

# python3, pwntools
sudo apt-get install python3 python3-pip python3-dev libssl-dev libffi-dev build-essential -y
sudo apt-get install libc6-i386 libc6-dbg make -y
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools
sudo apt-get install libcapstone-dev -y # to rop

# checksec
git clone https://github.com/slimm609/checksec.sh
sudo cp checksec.sh/checksec /usr/local/bin/

# ROPgadget
sudo -H python3 -m pip install ROPgadget

# OneGadget
sudo apt-get install ruby-full -y
sudo gem install one_gadget

# seccomp-tools
sudo gem install seccomp-tools

# pwndbg
git init
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
git checkout 2022.12.19
./setup.sh
cd ..

# pwninit
sudo apt install openssl
sudo apt install pkg-config
sudo apt-get install cargo -y
sudo apt-get install -y liblzma-dev
cargo install pwninit
sudo cp ~/.cargo/bin/pwninit /usr/local/bin/

# visual studio code
sudo apt-get install curl -y
sudo sh -c 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg'
sudo sh -c 'echo "deb [secarch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code -y
