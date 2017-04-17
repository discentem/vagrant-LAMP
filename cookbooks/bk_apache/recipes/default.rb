#
# Cookbook Name:: bk_apache
# Recipe:: default
#


#Install & enable Apache

package "apache2" do
  action :install
end

directory "/var/www/" do
  owner "vagrant"
  mode "777"
  action :create
end

service "apache2" do
  action [:enable, :start]
end

#Virtual Hosts Files

node["bk_apache"]["sites"].each do |sitename, data|

  document_root = "/var/www/html/#{sitename}"

  directory document_root do
    owner "vagrant"
    mode "0755"
    recursive true
  end

  template "#{sitename}" do
    source "virtualhosts.erb"
    path "/etc/apache2/sites-available/#{sitename}.conf"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => data["port"],
      :serveradmin => data["serveradmin"],
      :servername => data["servername"]
    )
    notifies :run, "execute[enable-sites]"
    notifies :restart, "service[apache2]"
  end

  execute "enable-sites" do
    command "a2ensite #{sitename}.conf"
    action :nothing
  end

  directory "/var/www/html/#{sitename}/logs" do
    action :create
  end

end

#Apache Configuration

execute "enable-event" do
  command "a2enmod mpm_event"
  action :nothing
end

cookbook_file "/etc/apache2/mods-available/mpm_event.conf" do
  source "mpm_event.conf"
  mode "0644"
  # notifies :run, "execute[enable-event]"
end
