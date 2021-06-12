package 'zsh-completions'

dotfile '.zshenv'
dotfile '.zshrc'

%W[
  #{ENV['HOME']}/.local/share/zsh
  #{ENV['HOME']}/.cache/zsh
].each do |dir|
  directory dir do
    owner node[:user]
    group node[:user]
    not_if { File.exist?(dir) }
  end
end
