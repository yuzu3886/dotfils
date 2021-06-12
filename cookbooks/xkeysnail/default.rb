paru 'xkeysnail'

template '/etc/sudoers.d/10-xkeysnail' do
  owner 'root'
  group 'root'
  source 'templates/10-xkeysnail'
  variables(
    user: node[:user]
  )
end

template "#{ENV['HOME']}/.config/systemd/user/xkeysnail.service" do
  owner node[:user]
  group node[:user]
  source 'templates/xkeysnail.service'
  variables(
    user: node[:user]
  )
end

dotfile '.config/xkeysnail'

user_service "xkeysnail" do
  action [:enable, :start]
end
