# ~/.zsh/aliases.zsh
# Central place for zsh aliases. Migrated from ~/.bash_aliases and ~/.bashrc

# dotfiles git alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# kubernetes
alias k=kubectl

alias cls='clear'
# ls family
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# colored ls/grep (Linux coreutils)
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alert after long-running command
alias alert='notify-send --urgency=low -i "$( [ $? = 0 ] && echo terminal || echo error )" "$(history|tail -n1|sed -e '"'"'s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'"'"')"'

# Docker / tooling
alias docker-compose='docker compose'

# Editors and TUI tools
alias vim='nvim'
alias ld='lazydocker'
alias lg='lazygit'

# ripgrep helper
alias rgf='rg --files | rg'
