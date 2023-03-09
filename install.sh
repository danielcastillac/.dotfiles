#/bin/sh

# Update and install packages
apt-get update
apt-get install build-essential stow curl -y

# Install kitty
sudo -u $USER curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Install i3wm
sudo -u $USER /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
apt install ./keyring.deb
sudo -u $USER echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | tee /etc/apt/sources.list.d/sur5r-i3.list
apt update
apt install i3 -y

#TODO Restart window manager and login after everything is set up https://www.reddit.com/r/i3wm/comments/5rnhtf/how_to_launch_i3/

