# dotfiles
dotfiles repository


## Installing dotfiles into a new system

First thing, ensure that the dotfiles have aliased the `config` command in the `.bashrc` and that `.cfg` folder is added to the `.gitignore` file.

Clone the repository:

```bash
git clone --bare <git-repo-url> $HOME/.cfg
```

Define temporary alias inside a shell:
 
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Checkout the content of the repository into the actual files:

```bash
config checkout
```

There is a high chance that some files have been changed and the command will throw an error that it cannot move the existing files as they have been modified. The script below moves the conflicting files to the backup folder:

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Checkout the repository once again

```bash
config checkout
```

Set the config folder not to show the untracked files

```bash
config config --local status.showUntrackedFiles no
```

Use the dotfiles as a standard git repository with `config` command :)

## Storing secrets in form of env variables
In case you want ot store some secret environment variables you should create `.bash_secrets` file in your home directory. This file will be automatically executed when starting new shell. This file is not commited to this repository for security reasons.
