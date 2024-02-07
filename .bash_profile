# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
# add file with user specific secrets
if [ -f ~/.bash_secrets ]; then
	. ~/.bash_secrets
fi
# User specific environment and startup programs


# Added by Toolbox App
export PATH="$PATH:/home/bartek/.local/share/JetBrains/Toolbox/scripts"
eval "$(gh completion -s bash)"
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

