# Set up the prompt
[ -f ~/.shellrc ] && source ~/.shellrc

eval "$(starship init bash)"
eval "$(zoxide init bash)"

# atuin -----------------------------------------------------------
[ -f "$HOME/.atuin/bin/env" ] && . "$HOME/.atuin/bin/env"

if [[ -f ~/.bash-preexec.sh ]]; then
  source ~/.bash-preexec.sh
elif [[ -f /run/current-system/sw/share/bash/bash-preexec.sh ]]; then
  source /run/current-system/sw/share/bash/bash-preexec.sh
fi

command -v atuin >/dev/null && eval "$(atuin init bash --disable-up-arrow)"
