#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum::default'
include_recipe 'yum-remi::default'

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

