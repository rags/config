# Lines configured by zsh-newuser-install 

######oh my zsh config######
export ZSH_CUSTOM=$HOME/.zsh/custom-omz/
ZSH=$HOME/.zsh/oh-my-zsh
#ZSH_THEME="robbyrussell"
plugins=(git pip brew osx python zsh-syntax-highlighting)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root) 
DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh
######oh my zsh config######

source ~/.zsh/myfunc
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


autoload -Uz compinit
autoload -U zargs
compinit
# End of lines added by compinstall
setopt prompt_subst
 
# define colors
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
done
PR_NO_COLOUR="%{$reset_color%}"


if [[ -z "$SSH_CLIENT" ]]; then
        prompt_host=""
else
        prompt_host=%{$fg_bold[white]%}@%{$reset_color$fg[yellow]%}$(hostname -s):
fi

# define the prompt
PROMPT='\
${prompt_host}$PR_RED%~ $PR_YELLOW$(git_super_status)
%(?..$PR_RED(%?%))$PR_LIGHT_CYAN>$PR_NO_COLOUR '
 
PS2='$PR_BLUE%_$PR_WHITE>$PR_NO_COLOUR '
 
#bindkey
bindkey "^W" kill-region
bindkey "^[^W" backward-kill-line

# vim:ft=zsh


if [ -d ~/functions ]; then
    fpath=(~/functions $fpath)
fi

#if [[ -e "`which tmux`" ]]; then
#  [ $TERM != "screen" ] && tmux
#fi

export RUBYOPT=rubygems
export EDITOR='emacsclient -t'
source ~/.zsh/aliases

if [ -f ~/.projectrc ]; then #overrides go here. this should be the last statement
    source ~/.projectrc
fi
#tmux
