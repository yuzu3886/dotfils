asdf_path = "#{ENV['HOME']}/.asdf"

execute "git clone https://github.com/asdf-vm/asdf #{asdf_path}" do
  user node[:user]
  not_if { File.exist?(asdf_path) }
end

%w[
  nodejs
  ruby
].each do |plugin|
  execute "#{asdf_path}/bin/asdf plugin add #{plugin}" do
    user node[:user]
    not_if "#{asdf_path}/bin/asdf plugin list | grep #{plugin}"
  end
end
