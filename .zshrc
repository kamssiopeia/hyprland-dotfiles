# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions # Suggests last used commands
zinit light zsh-users/zsh-completions # Additional completions for zsh
zinit light Aloxaf/fzf-tab # Use fzf tab to display autocompletions

# Add in snippets
zinit snippet OMZL::directories.zsh # OhMyZsh directories aliases
zinit snippet OMZP::git # OhMyZsh git aliases
zinit snippet OMZP::sudo # OhMyZsh plugin - 2x esc to add sudo to last command
zinit snippet OMZP::aliases # Python files need to be manually copied from https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e # Use emacs keybindings
bindkey '^[[B' history-search-forward # [↓] - Search forward in history considering prefix
bindkey '^[[A' history-search-backward # [↑] - search backward in history considering prefix
bindkey "^[[3~" delete-char # [Delete] - Delete forward
bindkey "^?" backward-delete-char # [Backspace] - Delete backward
bindkey '5~' kill-word # [Ctrl + Delete] - Delete whole word forward
bindkey '^H' backward-kill-word # [Ctrl + Backspace] - Delete whole word backward
bindkey "^[[1;5C" forward-word # [Ctrl + →] - Move forward one word
bindkey "^[[1;5D" backward-word # [Ctrl + ←] - Move backward one word
bindkey  "^[[H" beginning-of-line # [Home] - Go to beginning of line
bindkey  "^[[F" end-of-line # [End] - Go to end of line

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory # Appends history instead of overwriting
setopt sharehistory # Shares history between sessions
setopt hist_ignore_space # Add space before command to prevent command to being saved in history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Makes autocomplete case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Adds colors like ls --color to autocompletion
zstyle ':completion:*' menu no # Disables default zsh completion menu

# Aliases
alias ls='ls --color'
alias v='vim'
alias y='yazi'
alias c='clear'
alias history='cat ~/.zsh_history'

# Secret aliases
if [ -f "$HOME/.zsh_aliases" ]; then
   source $HOME/.zsh_aliases
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(thefuck --alias)"

# NVM
source /usr/share/nvm/init-nvm.sh

# Default editor
export EDITOR=/usr/bin/vim

# Base configuration isnspired by https://www.youtube.com/watch?v=ud7YxC33Z3w
