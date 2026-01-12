set -Ux PATH $HOME/.local/share/gem/ruby/3.4.0/bin $PATH
set -Ux PATH $HOME/.cargo/bin $PATH
set -Ux VCPKG_ROOT $HOME/.local/share/vcpkg
if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end
if test -f "$HOME/.elan/env"
    source "$HOME/.elan/env"
end
set -Ux EDITOR nvim
function secrets-open
    gocryptfs ~/stuff_bin/encrypted/secrets.enc ~/stuff_bin/secrets
end
function secrets-close
    fusermount3 -u ~/stuff_bin/secrets
end
function secrets-status
    mount | grep secrets.enc
end

function neovim 
  nvim $argv
end

function nv 
  nvim $argv
end
