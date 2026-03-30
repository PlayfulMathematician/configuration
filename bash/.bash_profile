# bash/.bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export PATH="/usr/bin:$PATH"
export PATH="/bin:$PATH"
export PATH="/usr/bin/vendor_perl:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/var/lib/snapd/snap/bin:$PATH"
export PATH="$HOME/CEdev/bin:$PATH"
unset PERL5LIB PERL_MB_OPT PERL_MM_OPT PERL_LOCAL_LIB_ROOT

export VCPKG_ROOT="$HOME/.local/share/vcpkg"
export EDITOR=nvim

if [ -f "$HOME/.elan/env" ]; then
  . "$HOME/.elan/env"
fi

export PATH="$HOME/.elan/bin:$PATH"
