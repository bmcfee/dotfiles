set fish_greeting ""
set FLINE_PATH $HOME/.config/fisherman/fishline

if set -q SSH_CLIENT
    set USERHOST USERHOST
else
    set USERHOST 
end
set FLINE_PROMPT STATUS $USERHOST SCREEN JOBS CONDA GIT FULLPWD WRITE N ROOT SPACE

set -gx PATH $HOME/miniconda3/bin $PATH
set -x PKG_CONFIG_PATH $HOME/lib/pkgconfig

source $HOME/.config/fish/condaline.fish

function fish_prompt
    fishline $status
end

ca py36

set -x TF_CPP_MIN_LOG_LEVEL 3

alias top=htop

set -x LIBROSA_CACHE_DIR /tmp/librosa_cache
set -x LIBROSA_CACHE_LEVEL 10

set -x TF_CPP_MIN_LOG_LEVEL 3
set -x EDITOR "nvim"
set -x FLSYM_CONDA  "\U0001F40D "

source ~/.local/share/icons-in-terminal/icons.fish

alias ls="ls -F --color"
