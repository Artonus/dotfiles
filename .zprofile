# ~/.zprofile - sourced for login shells

# Secrets (prefer zsh-specific, fallback to bash if POSIX-safe)
[ -f "$HOME/.zsh_secrets" ] && . "$HOME/.zsh_secrets"
[ -f "$HOME/.bash_secrets" ] && . "$HOME/.bash_secrets"

# Homebrew environment
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Dotnet
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"

# JetBrains Toolbox scripts
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# User-local bin (pipx, etc.)
export PATH="$PATH:$HOME/.local/bin"

# Optional user bin
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
