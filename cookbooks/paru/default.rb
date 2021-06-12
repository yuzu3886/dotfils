version = '1.7.2'
url = "https://github.com/Morganamilo/paru/releases/download/v#{version}/paru-v#{version}-x86_64.tar.zst"
path = "/tmp/paru"
archive = "#{path}/paru-v#{version}-x86_64.tar.zst"
paru_bin = "#{path}/paru"

directory path do
  owner node[:user]
  group node[:user]
  not_if { File.exist?(path) }
end

execute "curl -fSL -o #{archive} #{url}" do
  user node[:user]
  not_if 'command -v paru'
end

execute "zstd -dc #{archive} | tar -xf -" do
  user node[:user]
  not_if 'command -v paru'
  cwd path
end

execute "#{paru_bin} -Syu paru-bin --noconfirm --noprovides" do
  user node[:user]
  not_if 'command -v paru'
end

define :paru do
  name = params[:name].shellescape
  execute "paru -Syu #{name} --noconfirm --noprovides" do
    user node[:user]
    not_if "paru -Q #{name} || paru -Qg #{name}"
  end
end
