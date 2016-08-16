#
# Cookbook Name:: ubuntu-14-hardening
# Recipe:: default
#
# Copyright (c) 2016 Annie Hedgpeth, All Rights Reserved.

['/boot/grub/grub.cfg'].each do |name|
   file name do
     owner 'root'
     group 'root'
     mode '0700'
   end
 end

files={
  'limits.conf'=> '/etc/security/limits.conf',
  'sysctl.conf'=> '/etc/sysctl.conf'
}
files.each do |key,value|
  cookbook_file value do
    source key
    action :create
  end
end

execute 'unlink' do
  command'/usr/sbin/prelink -ua'
  only_if 'dpkg -s prelink'
end

['apport','whoopsie','prelink','nis'].each do |name|
   package name do
     action :purge
   end
 end

# Commented out because, while the CIS benchmark recommends it be activated, Chef cannot be run if Apparmor is enabled. 
# service ['apparmor', 'apparmor-utils'] do
#   action :enable
# end