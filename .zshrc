# Lines configured by zsh-newuser-install
source ~/.myfunc
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename '/cygdrive/c/.zshrc'


autoload -Uz compinit
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
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

# define the prompt
PROMPT='\
$PR_RED%~ $PR_YELLOW$(parse_git_branch)
%(?..$PR_RED(%?%))$PR_LIGHT_CYAN>$PR_NO_COLOUR '
 
PS2='$PR_BLUE%_$PR_WHITE>$PR_NO_COLOUR '
 
#bindkey
bindkey "^W" kill-region
bindkey "^[^W" backward-kill-line


# vim:ft=zsh

source ~/.aliases