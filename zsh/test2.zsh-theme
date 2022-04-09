# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
YS_VCS_PROMPT_PREFIX=" %{$fg_bold[green]%}["
YS_VCS_PROMPT_SUFFIX=""
YS_VCS_PROMPT_DIRTY="] %{$fg_bold[red]%}✖︎%{$reset_color%}"
YS_VCS_PROMPT_CLEAN="] %{$fg_bold[green]%}✔"

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$terminfo[bold]%{$fg[yellow]%}%n at $(box_name): \
$fg[red]%}${current_dir}%{$reset_color%}\
${git_info}
%{$terminfo[bold]$fg[red]%}# %{$reset_color%}"
else
PROMPT="
%{$terminfo[bold]%{$fg[yellow]%}%n at $(box_name): \
$fg[red]%}${current_dir}%{$reset_color%}\
${git_info}
%{$terminfo[bold]$fg[red]%}➜ %{$reset_color%}"
fi