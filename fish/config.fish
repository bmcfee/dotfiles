set fish_greeting ""
set FLINE_PATH $HOME/.config/fisherman/fishline

if set -q SSH_CLIENT
    set USERHOST USERHOST
else
    set USERHOST 
end
set FLINE_PROMPT STATUS $USERHOST JOBS CONDA GIT FULLPWD WRITE N ROOT SPACE


set -x PKG_CONFIG_PATH $HOME/lib/pkgconfig

source $HOME/.config/fish/conda.fish
source $HOME/.config/fish/condaline.fish
source $FLINE_PATH/init.fish

function fish_prompt
    fishline $status
end

ca py35

set -x TF_CPP_MIN_LOG_LEVEL 3

alias top=htop
