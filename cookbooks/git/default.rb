package 'git'

dotfile '.config/git'

diff_highlight_path = case node[:platform]
                      when 'arch'   then '/usr/share/git/diff-highlight/diff-highlight'
                      when 'darwin' then '/usr/local/share/git-core/contrib/diff-highlight/diff-highlight'
                      else nil
                      end

if diff_highlight_path and File.exist?(diff_highlight_path)
  link '/usr/local/bin/diff-highlight' do
    to diff_highlight_path
    user 'root'
    force true
  end
end
