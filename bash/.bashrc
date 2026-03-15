# bash/.bashrc
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

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
  pkill emacs
}

assasinate-vesktop() {
  pkill vesktop
}

eval "$(starship init bash)"

eval "$(zoxide init bash)"
