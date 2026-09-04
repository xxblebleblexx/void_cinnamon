#Make sure xbps already updated
sudo xbps-install -u xbps

#install WM depencies
sudo xbps-install -S xorg elogind dbus lightdm mesa linux7.2 linux7.2-headers sassc patch

#install cinnamon DE and cinnamon application 
sudo xbps-install -S cinnamon nemo gnome-screenshot gnome-terminal vim gedit git wget papirus-icon-theme firefox power-profiles-daemon pfetch cronie rsv engrampa unzip

#Network
sudo xbps-install -S NetworkManager

#Audio/bluetooth
sudo xbps-install -S pipewire wireplumber pavucontrol pulsemixer libspa-bluetooth blueman bluez bluez-cups

#bashrc conf
echo "PS1='\[\e[36m\]\W \[\e[35m\]❯❯ \[\e[0m\]'" >> $HOME/.bashrc
echo "pfetch" >> $HOME/.bashrc
echo "alias xin='sudo xbps-install -S'" >> $HOME/.bashrc
echo "alias xre='sudo xbps-remove -R'" >> $HOME/.bashrc
echo "alias xup='sudo xbps-install -Syu'" >> $HOME/.bashrc
echo "alias fp='patch -p1 <'" >> $HOME/.bashrc
echo "alias fpr='patch -p1 -R <'" >> $HOME/.bashrc
echo "alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'" >> $HOME/.bashrc

#using NetworkManager instead dhcpd and wpa_supplicant
sudo rm -rf /var/service/dhcpcd
sudo rm -rf /var/service/wpa_supplicant

#enable services
sudo ln -s /etc/sv/elogind /var/service/
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/lightdm /var/service/
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/power-profiles-daemon /var/service/
sudo ln -s /etc/sv/bluetoothd /var/service/
sudo ln -s /etc/sv/polkitd /var/service/
sudo ln -s /etc/sv/acpid /var/service/
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/

#set wallpaper 
gsettings set org.cinnamon.desktop.background picture-uri "file://$HOME/void_cinnamon/wallpaper.jpg"

echo "run: sudo reboot"
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/applications/pipewire.desktop /etc/xdg/autostart/
