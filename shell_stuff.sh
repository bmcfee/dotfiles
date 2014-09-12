export EDITOR="gvim -f"
export PYTHONPATH="${PYTHONPATH}:${HOME}/lib/python"

if [ -f ~/.private.sh ]; then
    . ~/.private.sh
fi
        RED="\[\033[0;31m\]"
 	  GREEN="\[\033[0;32m\]"
     YELLOW="\[\033[0;33m\]"
       BLUE="\[\033[0;34m\]"
DARK_PURPLE="\[\033[0;35m\]"
  DARK_CYAN="\[\033[0;36m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
  DARK_GRAY="\[\033[1;30m\]"
  LIGHT_RED="\[\033[1;31m\]"
GREEN="\[\033[1;32m\]"
PURPLE="\[\033[0;35m\]"
       CYAN="\[\033[1;36m\]"
      WHITE="\[\033[1;37m\]"
 COLOR_NONE="\[\e[0m\]"

function parse_git_branch {

  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^On branch ([^${IFS}]*)"
  remote_pattern="Your branch is (.*) of"
  diverge_pattern="Your branch and (.*) have diverged"
  if [[ ! ${git_status} =~ "working directory clean" ]]; then
    state="${RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW}↑"
    else
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo "${remote}$state${DARK_GRAY}:${DARK_CYAN}${branch}"
  fi
}

function test_ssh() {

    case "$HOSTNAME" in
        morrison*)
            HOSTCOLOR=${PURPLE}
        ;;
        theremin*)
            HOSTCOLOR=${DARK_PURPLE}
        ;;
        cosmal*)
            HOSTCOLOR=${YELLOW}
        ;;
        fwgserver*)
            HOSTCOLOR=${GREEN}
        ;;
        porkpie*)
            HOSTCOLOR=${LIGHT_RED}
        ;;
        *)
            HOSTCOLOR=${LIGHT_GRAY}
        ;;
    esac
    ssh_status="$(ps $PPID 2> /dev/null | grep sshd)"
    if [ $? -eq 0 ]; then
        echo "${LIGHT_GRAY}\\u${DARK_GRAY}@${HOSTCOLOR}\\h${DARK_GRAY}:"
    else
        echo ""
    fi
}

function prompt_func() {
    previous_return_value=$?;
    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
        xterm*|rxvt*)
            TITLEBAR="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]"
        ;;
        *)
            TITLEBAR=""
        ;;
    esac
    prompt="${TITLEBAR}${DARK_GRAY}[$(test_ssh)${CYAN}\w${DARK_CYAN}$(parse_git_branch)${DARK_GRAY}]${COLOR_NONE}"
    if test $previous_return_value -eq 0
    then
        PS1="${prompt}➔ "
    else
        PS1="${prompt}${RED}➔${COLOR_NONE} "
    fi

}

PROMPT_COMMAND=prompt_func
