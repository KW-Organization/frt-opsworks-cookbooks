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
