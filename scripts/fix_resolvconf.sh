sudo rm /etc/resolv.conf
sudo ln -s /run/resolvconf/resolv.conf /etc/resolv.conf
sudo resolvconf -u
