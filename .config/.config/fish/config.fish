if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting ""

# List files and directories in a column format.
alias ll 'ls -l'

# List all files and directories, including hidden ones.
alias la 'ls -a'

# List files and directories with a column format and show hidden ones.
alias lll 'ls -la'

# List files with human-readable file sizes.
alias lh 'ls -lh'

# List files and directories, including hidden ones, with human-readable file sizes.
alias lha 'ls -lha'

# List files and directories recursively.
alias lr 'ls -R'

# List files and directories and sort by time modified.
alias lt 'ls -lt'

# List files and directories and sort by file size.
alias ls-s 'ls -lhS'
# Check the status of your current branch.
alias gs 'git status'

# Add all changes to the staging area.
alias ga 'git add .'

# Commit changes with a message.
alias gc 'git commit -m'

# Push committed changes to the remote repository.
alias gp 'git push'

# Push to the origin main branch.
alias gpm 'git push origin main'

# Pull latest changes from the remote repository.
alias gpl 'git pull'

# Clone a repository.
alias gcl 'git clone'

# Show the commit history.
alias gl 'git log --oneline --decorate --all'

# Show a short log of the commit history.
alias gla 'git log --all --oneline --graph'

# Create a new branch and switch to it.
alias gco 'git checkout -b'

# Switch to an existing branch.
alias gcw 'git checkout'

# Stash uncommitted changes.
alias gst 'git stash'

# Apply the most recent stash.
alias gsta 'git stash apply'

# Unstage a file.
alias gru 'git restore --staged'

# Show the difference between the working directory and the index.
alias gd 'git diff'

# Show the difference between the index and the most recent commit.
alias gdc 'git diff --cached'
# Install packages
alias ins="sudo pacman -S"

# Remove packages and their unneeded dependencies and configuration files
alias rmv="sudo pacman -Rns"

# Search for packages
alias src="pacman -Ss"

# Clean the package cache (removes all cached packages)
alias cln="sudo pacman -Scc"

# List all installed packages
alias lst="pacman -Q"

# List explicitly installed packages (those not installed as dependencies)
alias lste="pacman -Qe"

# Synchronize, refresh databases, and upgrade all packages
alias upd="sudo pacman -Syu"

# Show information about an installed package
alias inf="pacman -Qi"

# List all files owned by a package
alias fil="pacman -Ql"

# Find which package owns a specific file
alias owp="pacman -Qo"

# Show reverse dependencies (packages that depend on a given package)
# Requires 'pactree', which is part of the 'pacman-contrib' package.
# Install with: sudo pacman -S pacman-contrib
alias dep="pactree -r"

# List orphaned packages (installed as dependencies but no longer needed)
alias aut="pacman -Qdt"

# Reinstall all packages (use with extreme caution, can break your system if not understood)
# This uses --overwrite "*" to force overwriting files if conflicts occur.
# Only use if you know exactly what you are doing.
alias fix="sudo pacman -S --overwrite '*'"

# List implicitly installed packages (dependencies)
alias hdp="pacman -Qd"

# Update mirrorlist using reflector
# Requires 'reflector' to be installed.
# Install with: sudo pacman -S reflector
alias mir="sudo reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist"

# Audit and force update/reinstall (use with extreme caution, similar to 'fix' but for sync)
# This will resynchronize database and force upgrade/reinstall all packages.
# Only use if you know exactly what you are doing.
alias aud="sudo pacman -Syyu --overwrite '*'"

pfetch
