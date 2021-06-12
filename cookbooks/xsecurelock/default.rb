paru 'xsecurelock'

remote_file '/usr/lib/systemd/system/xsecurelock@.service' do
  user 'root'
  source 'files/xsecurelock@.service'
end

service "xsecurelock@#{node[:user]}" do
  action :enable
  user 'root'
  provider :systemd
end
