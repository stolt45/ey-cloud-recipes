#
# Cookbook Name:: logrotate
# Recipe:: default
#
if ['solo', 'app','app_master'].include?(node[:instance_role])
  remote_file "/etc/logrotate.d/nginx" do
    source "nginx.logrotate"
    owner "root"
    group "root"
    mode "0655"
    backup 0
  end

  cron "logrotate -f /etc/logrotate.d/nginx" do
    hour    '*'
    command "logrotate -f /etc/logrotate.d/nginx"
    user "root"
  end
end
