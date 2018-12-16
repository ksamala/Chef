directory '/ksam' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/k_log' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/var/k_log/boot.log' do
  owner 'root'
  group 'root'
  mode '0644'
end
#***********************************
file '/ksam/k_shutdown.sh' do
  owner 'root'
  group 'root'
  mode '0755'
end
template '/ksam/k_shutdown.sh' do
  source 'shutdown.erb'
end
link '/usr/bin/k_shutdown.sh' do
  to '/ksam/k_shutdown.sh'
end
#***********************************
file '/ksam/k_restart.sh' do
  owner 'root'
  group 'root'
  mode '0755'
end
template '/ksam/k_restart.sh' do
  source 'restart.erb'
end
link '/usr/bin/k_restart.sh' do
  to '/ksam/k_restart.sh'
end
#***********************************
file '/ksam/k_monit.sh' do
  owner 'root'
  group 'root' 
  mode '0755'
end
template '/ksam/k_monit.sh' do
  source 'monit.erb'
end
link '/usr/bin/k_monit.sh' do
  to '/ksam/k_monit.sh'
end
#********************************
file '/ksam/k_cpu.sh' do
  owner 'root'
  group 'root' 
  mode '0755'
end
template '/ksam/k_cpu.sh' do
  source 'cpu.erb'
end
link '/usr/bin/k_cpu.sh' do
  to '/ksam/k_cpu.sh'
end
#******************************
cron 'chef' do
  minute '*/20'
	hour '*'
	day '*'
  command 'chef-client'
end

cron 'cpu_usage' do
  minute '*/3'
	hour '*'
	day '*'
  command 'k_cpu.sh'
end

cron 'ntpd' do
  minute '*/5'
  hour '*'
  day '*'
  command 'systemctl restart ntpd'
end

if node['hostname'] == 'server1'
  cron 'ansble_scripts' do
    minute '*/10'
    hour '*'
    day '*'
    command 'rsync -avh /ansible/* kalyansamala@10.0.0.231:/Users/kalyansamala/Ansible/server1_scripts/'
  end

end