 
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
        prompt_host=%{$fg_bold[white]%}@%{$reset_color$fg[yellow]%}$(hostname):
fi

# define the prompt
PROMPT='\
${prompt_host}$PR_RED%~ $PR_YELLOW$(git_super_status)
%(?..$PR_RED(%?%))$PR_LIGHT_CYAN>$PR_NO_COLOUR '
 
PS2='$PR_BLUE%_$PR_WHITE>$PR_NO_COLOUR '
