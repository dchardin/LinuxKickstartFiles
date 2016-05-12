install
url --url=ftp://192.168.1.50/pub/inst/
lang en_US.UTF-8
keyboard us
network --device eth0 --bootproto static --ip 192.168.122.50 --netmask 255.255.255.0 --gateway 192.168.122.1 --nameserver 192.168.122.1 --hostname server1.example.com
rootpw Pass123
firewall --service=ssh
authconfig --enableshadow --passalgo=sha512 --enablefingerprint
selinux --enforcing
timezone --utc America/Los_Angeles
bootloader --location=mbr --driveorder=vda --append="crashkernel=auto rhgb quiet"
zerombr yes
clearpart --linux --drives=vda --all --initlabel
ignoredisk --only-use=vda

part /boot --fstype=ext4 --size=500
part / --fstype=ext4 --size=8000
part swap --size=1000
part /home --fstype=ext4 --size=1000
firstboot --enable
reboot

%packages
@base
@client-mgmt-tools
@compat-libraries
@console-internet
@core
@debugging
@basic-desktop
@desktop-debugging
@desktop-platform
@directory-client
@fonts
@general-desktop
@graphical-admin-tools
@hardware-monitoring
@input-methods
@internet-applications
@internet-browser
@java-platform
@legacy-unix
@legacy-x
@network-file-system-client
@network-tools
@performance
@perl-runtime
@print-client
@remote-desktop-clients
@ruby-runtime
@system-management-snmp
@server-platform
@server-policy
@system-admin-tools
@x11
mtools
pax
python-dmidecode
oddjob
sgpio
genisoimage
wodim
lftp
mutt
certmonger
pam_krb5
krb5-workstation
nscd
pam_ldap
nss-pam-ldapd
perl-DBD-SQLite
%end
