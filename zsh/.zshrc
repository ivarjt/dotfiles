#Enable Powerlevel10k instant prompt if available
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

SSH_ENV="$HOME/.ssh/agent.env"

start_agent() {
  eval "$(ssh-agent -s)" > "$SSH_ENV"
  chmod 600 "$SSH_ENV"
  SSH_ASKPASS=/bin/false ssh-add ~/.ssh/id_ed25519 < /dev/null
}

if [ -f "$SSH_ENV" ]; then
  . "$SSH_ENV" > /dev/null
  # Check if agent is still alive
  ps -p $SSH_AGENT_PID > /dev/null || {
    start_agent
  }
else
  start_agent
fi



export PATH="$HOME/.local/bin:$PATH"
