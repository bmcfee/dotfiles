set fish_greeting ""
set FLINE_PATH $HOME/.config/fish/fishline
set FLINE_PROMPT STATUS JOBS PWD VFISH GIT WRITE N ROOT
#source $HOME/.config/fish/conda.fish
source $HOME/.config/fish/condaline.fish
source $FLINE_PATH/fishline.fish

function fish_prompt
    fishline $status
end

ca py35
#fish_vi_mode

