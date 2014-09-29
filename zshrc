#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

zstyle ":completion:*:commands" rehash 1

# enable git theme
zstyle ':vcs_info:*' enable git

# general aliasses
alias brew="sudo -u johanbloemberg -i brew"
alias vi=vim
alias less="less -n"

# disable autocorrect
unsetopt correct
unalias ack
unalias cd
unalias cp
unalias ebuild
unalias gcc
unalias gist
unalias grep
unalias heroku
unalias ln
unalias man
unalias mkdir
unalias mv
unalias mysql
unalias rm
unalias sl

# osx hacks
if [[ `uname` == 'Darwin' ]];then
	alias top="top -o cpu"
else
    alias top="top -d5 -c"
fi

# git aliasses
alias such=git
alias so=git
alias much=git
alias very=git
alias many=git
alias wow='git status -sb'
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

# osx ls colors
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# load tagged extras
test -f $HOME/.zshrc.extra && source $HOME/.zshrc.extra

# extra completions
fpath=(/usr/local/share/zsh/site-functions/ $fpath)
fpath=(~/.zsh/completion/ $fpath)
compinit -i

# always exit 0
true
