#mlocate
package 'mlocate' do
  action :install
end

execute 'updatedb' do
  command 'updatedb'
end

#***********************************
#lsof
package 'lsof' do
  action :install
end

#***********************************
#rsync 
package 'rsync' do
  action :install
end

#***********************************
#telnet
package 'telnet' do
  action :install
end

#***********************************
#nptd 
yum_package 'ntp' do
  action :install
end

service 'ntpd' do
  action [:enable, :start]
end

yum_package 'ntpdate' do
  action :install
end

template '/etc/ntp.conf' do
  source 'ntp.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[ntpd]'
end

#***********************************
#vim
package 'vim' do
  action :install
end
#***********************************

#sysstat
package 'sysstat' do
  action :install
end
#***********************************