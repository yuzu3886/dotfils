dotfile '.gemrc'
dotfile '.irbrc'

"#{ENV['HOME']}/.local/share/irb".tap do |dir|
  directory dir do
    owner node[:user]
    group node[:user]
    not_if { File.exist?(dir) }
  end
end
