[[ -n ${ZSH_PROF_ENABLED:-} ]] && zmodload zsh/zprof
for file in ~/.{aliases,path,exports,options}; do
		source "$file"
done
unset file

# Local variable zsh
ZLE_REMOVE_SUFFIX_CHARS=""
ZSH_THEME="test2"
# ZSH_THEME="robbyrussell"
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Thanks AI :)
# Completion is initialised by oh-my-zsh below, NOT here. The old block guarded on
# $ZSH_COMPDUMP, which omz does not set until oh-my-zsh.sh runs on line 19 — so the
# guard always missed, ran a full compinit+compdump, and omz then ran a second one.
# Measured cost of that double init: 279 ms of a 221 ms startup (zprof, 93.7%).

# plugin here
plugins=(git docker docker-compose kubectl gcloud)
source $ZSH/oh-my-zsh.sh
# Must come AFTER oh-my-zsh.sh: this file calls compdef on its first line, and
# oh-my-zsh.sh is now the only thing that runs compinit (which defines compdef).
source $ZSH/completions/_kubectl.zsh

# pprof
if [ -n "${ZSH_PROF_ENABLED:-}" ]; then
  zprof
fi

# yazi wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

alias claude='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" claude'

if [[ -n $TMUX ]]; then
  _tmux_refresh_env() {
    [[ -n $DISPLAY && -n $XAUTHORITY ]] && { _tmux_unhook_refresh_env; return }
    local line
    # Parsed in-shell; piping to grep would add a second fork per attempt.
    for line in ${(f)"$(tmux show-environment 2>/dev/null)"}; do
      case $line in
        # tmux prefixes removed variables with "-"; mirror that as an unset.
        -(DISPLAY|XAUTHORITY|WAYLAND_DISPLAY|SSH_AUTH_SOCK|SSH_CONNECTION)) unset "${line#-}" ;;
        (DISPLAY|XAUTHORITY|WAYLAND_DISPLAY|SSH_AUTH_SOCK|SSH_CONNECTION)=*) export "$line" ;;
      esac
    done
    [[ -n $DISPLAY && -n $XAUTHORITY ]] && _tmux_unhook_refresh_env
  }
  _tmux_unhook_refresh_env() {
    precmd_functions=(${precmd_functions:#_tmux_refresh_env})
  }
  precmd_functions+=(_tmux_refresh_env)
fi
