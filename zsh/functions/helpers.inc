# porcelain

rationale() {  # properly sets the RATIONALE variable
  if [ "$1" = "off" ]; then
    unset RATIONALE
    return
  fi

  if [ -n "$*" ]; then
    RATIONALE="$*"
  fi

  if [ -z "$RATIONALE" ]; then
    echo -n "Rationale: "
    read RATIONALE
  fi

  if echo $RATIONALE | grep -Eqv 'https?://'; then
    # no issue link detected in rationale, prompt
    local issue="$(_get_issue)"
  fi

  export RATIONALE="$(echo ${RATIONALE}${issue} )"
  _log_rationale_history "$RATIONALE"
}

_rationale_hook() {  # flash RATIONALE above prompt if set
  # see (http://wiki.bash-hackers.org/scripting/terminalcodes#foreground_coloring) if you find this terrible
  [ -n "$RATIONALE" ] && printf '%b\n' "\033[31mRATIONALE\033[39m: \033[33m$RATIONALE\033[39m"
}

rt () {  # fuzzy-select previous rationales, optionally editing them
  local text="$*"

  if [ -z "$text" ]
  then
    local out select_key OIFS
    OIFS=$IFS
    IFS=$'\n'

    out="$(cat $(_rationale_log) | cut -d'|' -f2 | sed '/^$/d' |
           fzf --tac \
           --prompt '(enter to select, or ctrl-{y,e} to yank or edit)> ' \
           --expect=ctrl-y,ctrl-e)"

    IFS=$OIFS
    if [ -z "$out" ]; then
      return
    fi

    select_key=$(head -1 <<< "$out")
    text=$(head -2 <<< "$out" | tail -1)
    case $select_key in
      (ctrl-y) echo "$text" | tr -d "\n" | pbcopy
        echo "$text"
        return ;;
      (ctrl-e) tmpfile=$(mktemp rt.XXX)
        echo "$text" > $tmpfile
        ${EDITOR:-vim} "$tmpfile"
        text="$(cat $tmpfile)"
        rm $tmpfile 2> /dev/null ;;
      (*)  ;;
    esac
    echo "$text"
  fi

  if [ -z "$text" ]
  then
    echo canceled
    return
  fi

  if [ "$text" = "off" ]
  then
    unset RATIONALE
    return
  fi

  # actually set the rationale
  rationale "$text"
}


# plumbing

_get_issue() {
  local issue_url
  echo -n "Issue URL: " >/dev/stderr
  read issue_url

  if [ -n "$issue_url" ]; then
    local issue=", $issue_url"
  fi
  echo $issue
}

_default_rationale_logfile=~/.rationale.log

_log_rationale_history() {
  echo "$(date)|${*}" >> $(_rationale_log)
}

_rationale_log() {
  local log="${1:-$_default_rationale_logfile}"
  if [ ! -f "$log" ]; then
    mktemp "$log"
  else
    echo "$log"
  fi
}


# configuration

sendenv="SendEnv RATIONALE*"
if [ ! -f ~/.ssh/config ]; then
  mkdir ~/.ssh 2>/dev/null
  echo "$sendenv" > ~/.ssh/config
else
  if ! grep -q "$sendenv" < ~/.ssh/config; then
    mv ~/.ssh/config ~/.ssh/config.bak
    cat <(echo $sendenv) ~/.ssh/config.bak > ~/.ssh/config
  fi
fi
unset sendenv

precmd_functions=($precmd_functions _rationale_hook)

# makes bash behave like zsh with respect to precmd_functions() array
source $(dirname -- "$0")/bash-preexec.inc
