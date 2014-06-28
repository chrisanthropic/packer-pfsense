# pfsense doesn't use /etc/rc.d so we have to create our own file to load modules at boot
touch /etc/rc.conf.local
chmod 777 /etc/rc.conf.local
echo 'vboxguest_enable="YES"' >> /etc/rc.conf.local
echo 'vboxservice_enable="YES"' >> /etc/rc.conf.local
chmod +x /etc/rc.conf.local