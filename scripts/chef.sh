# Virtualbox kept failing here fore some reason, so I moved software installs back to the boot command for Virtualbox only 
set -x
if test -f .vbox_version ; then
echo "Nothing to see here, move along"
elif [ ! -e /home/vagrant/.vbox_version ] ; then
pkg_add -r ruby 
pkg_add -r rubygem-chef-server
fi