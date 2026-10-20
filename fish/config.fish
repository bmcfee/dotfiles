# Global environment variables (needed by both interactive and non-interactive shells)
 set -gx PKG_CONFIG_PATH $HOME/lib/pkgconfig
 set -gx MAMBA_NO_BANNER 1
 set -gx LIBROSA_CACHE_DIR /tmp/librosa_cache
 set -gx LIBROSA_CACHE_LEVEL 10
 set -gx TF_CPP_MIN_LOG_LEVEL 3
 set -gx EDITOR "nvim"
 # set -gx FLSYM_CONDA "\U0001F40D "

 # Paths
 fish_add_path "$HOME/.local/bin"

 # Interactive session configurations
 if status is-interactive
     set fish_greeting ""

     # Set USERHOST if in an SSH session
     if set -q SSH_CLIENT
         set USERHOST (whoami)@(prompt_hostname)
     else
         set USERHOST ""
     end

     # Theme
     source $HOME/.config/fish/themes/tokyonight_moon.fish

     # Abbreviations (faster and cleaner than aliases)
     abbr -a top btop
     abbr -a vim nvim
     abbr -a ls lsd
     abbr -a ca "conda activate"
     abbr -a cda "conda deactivate"

     # GitHub Token
     if test -f ~/.github_token
         set -gx GITHUB_TOKEN (cat ~/.github_token | string trim)
     end

     # Conda initialization
     if test -f $HOME/miniconda3/bin/conda
         #eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
         conda activate py13
     end
 end
