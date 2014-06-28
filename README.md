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
 There is quite a bit of hackery to get this working. I'll document it later and hopefully others will come along and help pretty it up.