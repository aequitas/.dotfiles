#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/prezto/init.zsh"
fi

# Customize to your needs...

zstyle ":completion:*:commands" rehash 1

# enable git theme
zstyle ':vcs_info:*' enable git

# general aliasses
alias ll="ls -la"
alias brew="sudo -u johanbloemberg -i brew"
alias vi=vim
alias less="less -n"

# osx hacks
if [[ `uname` == 'Darwin' ]];then
	alias top="top -o cpu"
fi

# git aliasses
alias such=git
alias so=git
alias much=git
alias very=git
alias many=git
alias wow='git status'
alias omg='git ll'

# python
export PYTHONSTARTUP=~/.pystartup
export WORKON_HOME=~/.envs
test -f /usr/local/bin/virtualenvwrapper.sh && source /usr/local/bin/virtualenvwrapper.sh

# vagrant 
alias v=vagrant
alias V=vagrant
alias vp="vagrant provision"
alias vpp="vagrant provision --provision-with=puppet"
alias vrpp="vagrant reload --provision --provision-with=puppet"
alias vu="vagrant up"
alias vr="vagrant reload"
alias vs="vagrant ssh"

# fix mount output for osx
alias mount='mount | column -t'

# load tagged extras
test -f $HOME/.zshrc.extra && source $HOME/.zshrc.extra