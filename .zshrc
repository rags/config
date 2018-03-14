# Lines configured by zsh-newuser-install 

######oh my zsh config######
export ZSH_CUSTOM=$HOME/.zsh/custom-omz/
ZSH=$HOME/.zsh/oh-my-zsh
ZSH_THEME="my"
ZSH_TMUX_AUTOSTART=false
plugins=(git pip brew brew-cask osx python zsh-syntax-highlighting aws command-not-found common-aliases jsontools sudo tmux colorize cp copyfile dirpersist dircycle extract)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root) 
DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh
######oh my zsh config######


source ~/.zsh/git-prompt/zshrc.sh
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
DIRSTACKSIZE=10
setopt autocd
setopt HISTIGNOREDUPS 
setopt autopushd
unsetopt beep
unsetopt correct
unsetopt correct_all
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename '~/.zshrc'

if [ -d ~/.zsh/completion ]; then
    fpath=(~/.zsh/completion $fpath)
fi

autoload -U zmv
autoload -Uz compinit
autoload -U zargs
compinit
# End of lines added by compinstall
setopt prompt_subst
 
#bindkey
bindkey "^W" kill-region
bindkey "^[^W" backward-kill-line

# vim:ft=zsh

if [ -d ~/.zsh/functions ]; then
    fpath=(~/.zsh/functions $fpath)
fi

#if [[ -e "`which tmux`" ]]; then
#  [ $TERM != "screen" ] && tmux
#fi

export RUBYOPT=rubygems
export EDITOR='emacsclient -t'
source ~/.zsh/aliases
source ~/.zsh/myfunc
if [ -f ~/.projectrc ]; then #overrides go here. this should be the last statement
    source ~/.projectrc
fi
#tmux


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH=$PATH:/usr/local/aws/bin/:/usr/local/Cellar/awscli/1.10.17/libexec/bin/










