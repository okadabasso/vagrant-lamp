#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum::default'
yum_repository 'remi' do
  description 'Les RPM de Remi - Repository'
  baseurl 'http://rpms.famillecollet.com/enterprise/7/php70/x86_64/'
  repositoryid 'remi-php70'
  gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  fastestmirror_enabled true
  action :create
end

yum_repository 'remi' do
  description 'Les RPM de Remi - Repository'
  baseurl 'http://rpms.famillecollet.com/enterprise/7/remi/x86_64/'
  mirrorlist 'http://rpms.famillecollet.com/enterprise/7/remi/mirror'
  repositoryid 'remi'
  gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  fastestmirror_enabled true
  action :create
end

%w[
  gd-last
  t1lib
].each do |pkg|
    package "#{pkg}" do
        action [ :install ]
        options "--enablerepo=remi"
    end
end

%w[
  php
  php-cli
  php-common
  php-gd
  php-xml
  php-pdo
  php-mbstring
  php-mysqlnd
].each do |pkg|
  package "#{pkg}" do
    action :install
    options '--enablerepo=remi-php70'
  end
end

