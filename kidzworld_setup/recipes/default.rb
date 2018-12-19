template "/root/kwprodlogrotate.conf" do
  source "kwprodlogrotate.conf"
  owner "root"
  group "root"
  mode 0644
end

cron 'kidzworld_production_logrotate' do
  minute '*/5'
  command '/usr/sbin/logrotate /root/kwprodlogrotate.conf'
end

template "/root/nginxtos3.sh" do
  source "nginxtos3.sh"
  owner "root"
  group "root"
  mode 0644
end

cron 'kidzworld_production_nginxtos3' do
  minute '10'
  hour '0'
  command '/bin/bash /root/nginxtos3.sh'
end
