[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

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

eval "$(starship init bash)"

eval "$(zoxide init bash)"
