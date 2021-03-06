#
# Cookbook Name:: fixhosts
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute "sed -i '/chef.automate-demo.com/d' /etc/hosts" do
  action :run
  only_if "grep 'chef.automate-demo.com' /etc/hosts"
end

hostsfile_entry node['ipaddress'] do
  hostname  'chef.automate-demo.com'
  aliases   ['chef']
  action    :create
end
