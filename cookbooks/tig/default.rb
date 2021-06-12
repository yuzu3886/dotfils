package 'tig'

dotfile '.config/tig'

"#{ENV['HOME']}/.local/share/tig".tap do |dir|
  directory dir do
    owner node[:user]
    group node[:user]
    not_if { File.exist?(dir) }
  end
end
