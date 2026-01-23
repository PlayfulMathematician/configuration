fish_add_path --prepend /usr/bin /bin
fish_add_path --prepend /usr/bin/vendor_perl
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/share/gem/ruby/3.4.0/bin 
fish_add_path $HOME/go/bin
set -e PERL5LIB PERL_MB_OPT PERL_MM_OPT PERL_LOCAL_LIB_ROOT
set -Ux VCPKG_ROOT $HOME/.local/share/vcpkg


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

starship init fish | source


