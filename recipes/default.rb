#
# Cookbook Name:: ubuntu-14-hardening
# Recipe:: default
#
# Copyright (c) 2016 Annie Hedgpeth, All Rights Reserved.

apt_update 'all platforms' do
  action :update
end

['/boot/grub/grub.cfg'].each do |name|
   directory name do
     owner 'root'
     group 'root'
   end
 end