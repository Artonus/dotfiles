# alias for the dotfiles 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# vscode using flathub
#alias code="flatpak run com.visualstudio.code"
alias k=kubectl

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# alias for the backwards compatibility of the docker compose
alias docker-compose='docker compose'
#alias docker='podman'
alias vim='nvim'
alias ld='lazydocker'
alias lg='lazygit'
#alias mc='/usr/bin/mc/mc-wrapper.sh'
