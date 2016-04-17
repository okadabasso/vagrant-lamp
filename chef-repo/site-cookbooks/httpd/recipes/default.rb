#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'httpd' do
    action [ :install ]
end

%w{
    httpd
    firewalld
}.each do |svc|
    service svc do
        supports [ :restart, :reload ]
        action [ :enable, :start ]
    end
end

allow_port = 80
execute "allow port #{allow_port}" do
    command "firewall-cmd --add-service=http --zone=public --permanent"
    notifies :restart, "service[firewalld]"
end