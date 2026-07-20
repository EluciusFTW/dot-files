# Set up the prompt
[ -f ~/.shellrc ] && source ~/.shellrc

eval "$(starship init bash)"
eval "$(zoxide init bash)"

. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"
