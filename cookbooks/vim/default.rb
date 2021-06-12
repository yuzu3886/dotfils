package 'vim'

dotfile '.vim'

"#{ENV['HOME']}/.cache/vim".tap do |dir|
  directory dir do
    owner node[:user]
    group node[:user]
    not_if { File.exist?(dir) }
  end
end

"#{ENV['HOME']}/.local/share/vim/pack/minpac/opt/minpac".tap do |path|
  execute "git clone https://github.com/k-takata/minpac #{path}" do
    user node[:user]
    not_if { File.exist?(path) }
  end
end

execute %q(vim -Nu "${HOME}/.vim/minpac.vim" -c "call PackInit({ 'progress_open': 'none' }) | call minpac#update('', { 'do': 'quit' })") do
  user node[:user]
  not_if { File.exist?("#{ENV['HOME']}/.local/share/vim/pack/minpac/start") }
end
