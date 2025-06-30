# Enable Powerlevel10k instant prompt if available
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Silence warnings from Powerlevel10k instant prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Load Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-completions fzf)

# Fix plugin path for zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k config if it exists
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ~/.zshrc — Keychain Setup
eval $(keychain --eval id_ed25519 2>/dev/null)
	
# Keybindings
bindkey '^I' complete-word

# Aliases
alias cls='clear'
alias cat='bat'
alias ls='eza'
alias la='eza -ll'
alias ll='eza -ll'
alias tree='eza --tree'
alias neofetch='fastfetch'
alias explorer='nautilus'

# Github Aliases
alias pinggit="ssh -T git@github.com"
alias gs="git status -sb"
alias gp='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gl='git pull origin $(git rev-parse --abbrev-ref HEAD)'

unalias gcb 2>/dev/null

gcb() {
  if [ -z "$1" ]; then
    echo "Usage: gcb <branch-name>"
    return 1
  fi
  git checkout -b "$1" && git push -u origin "$1"
}

# Python venv activate helper
activate() {
    if [ -f venv/bin/activate ]; then
        source venv/bin/activate
    elif [ -f .venv/bin/activate ]; then
        source .venv/bin/activate
    else
        echo "No virtual environment found (expected 'venv/' or '.venv/')"
    fi
}

# Disable unwanted shell behaviors
unsetopt AUTO_CD CORRECT CORRECT_ALL

# Prevent "folder-as-command" fallback
if typeset -f command_not_found_handler &>/dev/null; then
  unset -f command_not_found_handler
fi

# Auto-launching ssh-agent (AFTER prompt loads)
env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
agent_start () { (umask 077; ssh-agent >| "$env"); . "$env" >| /dev/null ; }

#agent_load_env
#agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
#
#if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
#    agent_start
#    ssh-add </dev/null 2>/dev/null
#elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
#    ssh-add </dev/null 2>/dev/null
#fi
#
#unset env

# ~/.zshrc — SSH Agent Autostart
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add ~/.ssh/id_ed25519
fi




export PATH="$HOME/.local/bin:$PATH"
