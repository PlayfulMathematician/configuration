# bash/.bashrc
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi
secrets-open() {
  gocryptfs ~/stuff_bin/encrypted/secrets.enc ~/stuff_bin/secrets
}

secrets-close() {
  fusermount3 -u ~/stuff_bin/secrets
}

secrets-status() {
  mount | grep secrets.enc
}

neovim() {
  nvim "$@"
}

nv() {
  nvim "$@"
}

assasinate-emacs() {
  pkill -9 emacs
}

assasinate-vesktop() {
  pkill -9 vesktop
}

eval "$(starship init bash)"

eval "$(zoxide init bash)"
# Load pyenv automatically by appending
# the following to
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Restart your shell for the changes to take effect.
