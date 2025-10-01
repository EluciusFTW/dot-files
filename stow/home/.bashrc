export EDITOR="nvim"

alias ll="ls -la"
alias nixc="sudoedit /etc/nixos/configuration.nix"
alias nixr="sudo nixos-rebuild switch"
alias png="ping www.google.com"

eval "$(starship init bash)"
eval "$(zoxide init bash)"
