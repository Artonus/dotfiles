# ~/.zshrc - sourced for interactive shells

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=2000
setopt APPEND_HISTORY         # append to history file
setopt HIST_IGNORE_SPACE      # ignore commands starting with space
setopt HIST_IGNORE_ALL_DUPS   # remove older duplicate entries
setopt SHARE_HISTORY          # share history across sessions

# Colors and pager
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b ~/.dircolors 2>/dev/null || dircolors -b)"
fi
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Source aliases (reuse existing)
if [ -f "$HOME/.zsh/aliases.zsh" ]; then
  source "$HOME/.zsh/aliases.zsh"
fi

# Completion system
autoload -Uz compinit && compinit

# kubectl completion and alias support
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
  # Attach completion to short alias 'k' if defined
  compdef __start_kubectl k 2>/dev/null
fi

# GitHub CLI completion
command -v gh >/dev/null 2>&1 && eval "$(gh completion -s zsh)"

# FZF integration
if [[ "$PATH" != *"/home/linuxbrew/.linuxbrew/opt/fzf/bin"* ]]; then
  PATH="$PATH:/home/linuxbrew/.linuxbrew/opt/fzf/bin"
fi
command -v fzf >/dev/null 2>&1 && eval "$(fzf --zsh)"


# TERM tweak for screen
[[ "$TERM" == "screen-256color" ]] && export TERM=screen

# Functions migrated from bash
search() {
  if [[ -z "$1" ]]; then
    echo "Usage: search <term> [directory]"
    echo "Example: search IUserService ./src"
    return 1
  fi
  local searchDir="${2:-.}"
  grep -rIin --color=auto -rin \
    --exclude="*log" --exclude="*.pdb" --exclude="*.dll" \
    --exclude-dir={bin,obj,.git,badger,packages,publish,debug,.idea,.venv,gatling-*} \
    "$1" "$searchDir"
}

clear_nuget_cache() { dotnet nuget locals all --clear && dotnet restore }

docker_stop_all() { docker stop $(docker ps -a -q) }

docker_start_all() { docker start $(docker ps -a -q) }

# Show onefetch when entering a new git repo (once per repo)
typeset -g LAST_REPO=""
chpwd() {
  git rev-parse --show-toplevel >/dev/null 2>&1 || return 0
  local repo
  repo="$(basename "$(git rev-parse --show-toplevel)")"
  if [[ "$LAST_REPO" != "$repo" ]]; then
    command -v onefetch >/dev/null 2>&1 && onefetch
    LAST_REPO="$repo"
  fi
}

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="juanghurtado" # fino, gnzh, jonathan, juanghurtado, robbyrussell
plugins=(git)

source $ZSH/oh-my-zsh.sh