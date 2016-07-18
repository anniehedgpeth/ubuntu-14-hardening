#
# Cookbook Name:: ubuntu-14-hardening
# Recipe:: default
#
# Copyright (c) 2016 Annie Hedgpeth, All Rights Reserved.

['/boot/grub/grub.cfg'].each do |name|
   directory name do
     owner 'root'
     group 'root'
     mode '0700'
   end
 end
