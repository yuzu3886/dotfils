package 'pipewire'
package 'pipewire-pulse'

user_service 'pipewire' do
  action [:enable, :start]
end

user_service 'pipewire-pulse' do
  action [:enable, :start]
end
