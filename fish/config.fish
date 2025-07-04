set fish_greeting ""

if set -q SSH_CLIENT
    set USERHOST USERHOST
else
    set USERHOST 
end
set -x PKG_CONFIG_PATH $HOME/lib/pkgconfig

set -x MAMBA_NO_BANNER 1

#source $HOME/.config/fish/conf.d/dracula.fish
#source $HOME/.config/fish/conf.d/bauhaus.fish
source $HOME/.config/fish/themes/tokyonight_moon.fish
#source $FLINE_PATH/themes/washed.fish

alias top=btop
alias vim=nvim
alias ls=lsd
#alias ls="ls -F --color"


set -x LIBROSA_CACHE_DIR /tmp/librosa_cache
set -x LIBROSA_CACHE_LEVEL 10

set -x TF_CPP_MIN_LOG_LEVEL 3
set -x EDITOR "nvim"
set -x FLSYM_CONDA  "\U0001F40D "

# source ~/.local/share/icons-in-terminal/icons.fish

alias ca="conda activate"
alias cda="conda deactivate"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/bmcfee/miniconda3/bin/conda
    #    status is-interactive && eval /home/bmcfee/miniconda3/bin/conda "shell.fish" "hook" $argv | source
    #    status is-interactive && cda
    status is-interactive && ca py13
end
# <<< conda initialize <<<
#
