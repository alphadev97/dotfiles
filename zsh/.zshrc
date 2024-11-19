# Disable instant prompt to avoid warnings
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias inv='nvim $(fzf --preview="cat {}")'

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the theme to powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
plugins=(git)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$PATH:/usr/local/go/bin

# Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH=$PATH:~/go/bin:/usr/local/go/bin

# Enable fzf keybindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Run neofetch on terminal startup for Kitty
if [[ "$TERM" == "xterm-kitty" ]]; then
    neofetch
fi

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
