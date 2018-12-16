
template "/etc/motd" do
	source "motd.erb"
	mode "0644"
end

template "/root/.bashrc" do
	action :create
        source "bashrc.erb"
        mode "0744"
end


