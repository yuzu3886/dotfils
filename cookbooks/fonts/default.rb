%w[
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  ttf-jetbrains-mono
].each do |font|
  package font
end

fonts_path = "#{ENV['HOME']}/.local/share/fonts"
directory fonts_path do
  owner node[:user]
  group node[:user]
  not_if { File.exist?(fonts_path) }
end

%w[
  Mplus1Code-Regular.otf
  Mplus1Code-Bold.otf
].each do |font|
  font_path = "#{fonts_path}/#{font}"
  execute "curl -fSL -o #{font_path} https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/otf/#{font}" do
    user node[:user]
    not_if { File.exist?(font_path) }
  end
end
