#platform=x86, AMD64, or Intel EM64T
#version=DEVEL
# Install OS instead of upgrade
install
# Keyboard layouts
keyboard 'us'
# Reboot after installation
reboot
# Root password
rootpw --plaintext defpwd
# System timezone
timezone America/New_York --isUtc
# System language
lang en_US
# Firewall configuration
firewall --disabled
# Network information
network  --bootproto=dhcp --device=eth0
# System authorization information
auth  --useshadow  --passalgo=sha512
# Use CDROM installation media
cdrom
# Use graphical install
graphical
# SELinux configuration
selinux --disabled
bootloader --location=mbr --driveorder=sda,vda --append="rhgb quiet"
zerombr
clearpart --all --initlabel
part /boot --fstype=ext4 --asprimary --size=3072
part pv.hd --grow --size=500 --encrypted --passphrase=1234567890
volgroup vg1 --pesize=4096 pv.hd
logvol /home --fstype=ext4 --name=Home --vgname=vg1 --size=4096
logvol / --fstype=ext4 --name=Root --vgname=vg1 --size=15000
logvol swap --name=Swap --vgname=vg1 --size=4096
logvol /VirtualMachines --fstype=ext4 --name=VirtualMachines --vgname=vg1 --size=1 --maxsize=3000 --grow
services --enabled=NetworkManager,NetworkManager-dispatcher
firstboot --enable

%packages
@xfce-desktop
@xfce-media
@xfce-apps
@xfce-extra-plugins

%end
