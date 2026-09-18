if [[ -z $DISPLAY ]] && (( ${XDG_VTNR:-0} == 1 )) && (( $+commands[startx] )); then
  exec startx
fi
