case node[:platform]
when 'arch'
  paru 'ghq-bin'
when 'darwin'
  package 'ghq'
end
