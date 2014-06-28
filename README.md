packer-pfsense
===========
Packer stuff to build pfSense 2.1.2

## Requirements
* Packer
* Vagrant
* Virtualbox and/or VMware

## About the Boxes
We start with a pfSense 2.1.2 x32 base .iso and run a few scripts on it before creating a vagrant compatible .box for Virtualbox and/or VMware.

#### pfSense 2.1.2
 - ruby-gem chef installed for provisioning.
 - User 'vagrant' is created with password 'vagrant' and added to user group 'wheel'.
 - Enables passwordless sudo for user group 'wheel'.
 - Authorized keys for 'vagrant' user are stored in the ~/.ssh directory.
 - Enables ssh service at boot.
 - Vagrant shared folders are turned off.
 - Vagrant provisioning doesn't currently work so provision with Packer.

## TODO
 - vmware build
 - get guest additions working
 - read up more on pfSense 'pre-flight install' and see if we can use it | https://doc.pfsense.org/index.php/Booting_Options#Customizing_the_boot_environment
 - if that doesn't work, try restoring from floppy using packer/floppy_files and this link https://doc.pfsense.org/index.php/Automatically_Restore_During_Install
 
## Notes
 There is quite a bit of hackery to get this working. I'm new to FreeBSD and pfSense so I'll document stuff here.
 
 - There is no 'preload' like Debian boxes, so instead we have to get certain things done in the 'boot command' step:
   - install sudo, bash, ruby, rubygem-chef (omnibus installer doesn't work with FreeBSD 9), virtualbox-ose-additions
   - create our user 'vagrant' with password 'vagrant'
   - change root password to 'vagrant'
   - add user 'vagrant' to 'wheel' group
   - enable passwordless sudo for 'wheel' group

 - Once that's done we upload our config.xml from out http folder to the VM
   - This config file may not be secure, I'm more focused on making things work for now.
 
 - Things that have to be in there for packer/vagrant to work:
   - group 'wheel'
   - user 'vagrant' with mitchellh authorized_key
   - ```<enablesshd/>```

 - pfSense likes to mess with /etc/passwd and other stuff on reboot so we need to reset our user 'vagrant' user stuff by using <shellcmd> in the imported confit.xml to issue commands at boot
   - ```<shellcmd>pw usermod vagrant -s /usr/local/bin/bash</shellcmd>```
   - ```<shellcmd>pw group mod wheel -m vagrant</shellcmd>```
   - ```<shellcmd>chown -R vagrant /home/vagrant/.ssh</shellcmd>```

 - Frome here our regular scripts take over like a normal Packer install
   - config.sh writes our /http/confit.xml file to /conf/config.xml
   - vmtools.sh supposedly enables virtualbox modules but damned if I can get it working
   - vagrant.sh imports keys and stuff