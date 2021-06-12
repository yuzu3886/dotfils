node.reverse_merge!(
  user: ENV['SUDO_USER'] || ENV['USER']
)

%W[
  #{ENV['HOME']}/.config
  #{ENV['HOME']}/.local
  #{ENV['HOME']}/.local/share
  #{ENV['HOME']}/.cache
].each do |dir|
  directory dir do
    owner node[:user]
    group node[:user]
    not_if { File.exist?(dir) }
  end
end

include_cookbook 'functions'
