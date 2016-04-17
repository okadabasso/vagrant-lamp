#
# Cookbook Name:: mariadb
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum::default'
yum_repository "mariadb-10.1.13" do
    description 'MariaDB Official Repository'
    baseurl 'http://yum.mariadb.org/' + \
            '10.1.13' + "/centos7-amd64"
    gpgkey 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB'
    action :create
end

package 'MariaDB-shared' do
    action [ :install ]
    options "--enablerepo=mariadb-10.1.13"
end
package 'MariaDB-server' do
    action [ :install ]
    options "--enablerepo=mariadb-10.1.13"
end
package 'MariaDB-client' do
    action [ :install ]
    options "--enablerepo=mariadb-10.1.13"
end
