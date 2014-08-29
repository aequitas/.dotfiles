#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# shell history
export HISTCONTROL=ignoredups
export HISTSIZE=500000
export HISTFILESIZE=500000

# terminal
export TERM=xterm-256color
export TZ=Europe/Amsterdam
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# virtualenvwrapper default dir
export WORKON_HOME=~/.envs

# add preferred custom in paths
export PATH=~/.bin:/usr/local/bin:/usr/local/sbin:$PATH

# add additional bin search paths
export PATH=$PATH:/usr/local/share/npm/bin

