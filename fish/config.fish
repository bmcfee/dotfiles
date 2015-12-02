set fish_greeting ""
set FLINE_PATH $HOME/.config/fish/fishline
set FLINE_PROMPT STATUS JOBS PWD VFISH GIT WRITE USERHOST N ROOT SPACE
source $HOME/.config/fish/condaline.fish
source $FLINE_PATH/fishline.fish

function fish_prompt
    fishline $status
end

ca py35

