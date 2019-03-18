_proxyman_completions()
{
  local curr_arg
  curr_arg=${COMP_WORDS[COMP_CWORD]}
  if [[ $COMP_CWORD == 1 ]]; then # if I'm writing the first argument after proxyman, complete with the basic commands (set, unset, list, ...)
    COMPREPLY=( $(compgen -W 'set unset list configs load delete help' -- $curr_arg ) )
  elif [[ $COMP_CWORD == 2 ]]; then # if I'm writing the second argument, and the first one was load or delete, complete with the names os stored profiles
    local prev_arg
    prev_arg=${COMP_WORDS[COMP_CWORD-1]}
    if [[ $prev_arg == "delete" || $prev_arg == "load" ]]; then
        configs=$(ls "$HOME/.config/proxyman/")
        COMPREPLY=( $(compgen -W "$configs" -- $curr_arg ) )
    fi
  fi
}

complete -F _proxyman_completions proxyman

