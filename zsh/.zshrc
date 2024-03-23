# Load all all dep's
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

# Magic happen for completion
autoload -Uz compinit
if [[ -n "$ZSH_COMPDUMP"(#qN.mh+24) ]]; then
  compinit -i -d "$ZSH_COMPDUMP"
  compdump
else
  compinit
fi

# plugin here
plugins=(git docker docker-compose kubectl gcloud)
source $ZSH/completions/_kubectl.zsh
source $ZSH/oh-my-zsh.sh

# pprof
if [ -n "${ZSH_PROF_ENABLED:-}" ]; then
  zprof
fi