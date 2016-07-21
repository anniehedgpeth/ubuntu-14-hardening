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

['apport','whoopsie','prelink'].each do |name|
   package name do
     action :remove
   end
 end