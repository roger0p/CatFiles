set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "exa --icons --group-directories-first -l"
alias la "exa --icons --group-directories-first -a"
alias ll "exa --icons --group-directories-first -la"
alias lla "exa -lT"
alias g git
alias :q exit
alias :so "exec fish"
command -qv nvim && alias vim nvim
alias ttd 'tt -csv >> ~/wpm.csv'
alias tm tmux
alias tma "tmux a"
alias tmks "tmux kill-server"

set -gx EDITOR nvim

set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# FZF STUFF
set -gx FZF_DEFAULT_COMMAND 'fd --type f'
set -gx FZF_DEFAULT_OPTS "\
  --color fg:#cdd6f4,bg:#1e1e2e
  --color bg+:#ef7d7d,fg+:#2c2f30
  --color hl:#dadada,hl+:#26292a,gutter:#1e1e2e
  --color pointer:#f5e0dc,info:#cba6f7
  --border
  --color border:#89b4fa
  --inline-info
  --height 13"

# Catppuccin theme for FZF
# set -gx FZF_DEFAULT_OPTS "\
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# THEME
# name: 'Catppuccin mocha'
# url: 'https://github.com/catppuccin/fish'
# preferred_background: 1e1e2e

set -gx fish_color_normal cdd6f4
set -gx fish_color_command 89b4fa
set -gx fish_color_param f2cdcd
set -gx fish_color_keyword f38ba8
set -gx fish_color_quote a6e3a1
set -gx fish_color_redirection f5c2e7
set -gx fish_color_end fab387
set -gx fish_color_error f38ba8
set -gx fish_color_gray 6c7086
set -gx fish_color_selection --background=313244
set -gx fish_color_search_match --background=313244
set -gx fish_color_operator f5c2e7
set -gx fish_color_escape f2cdcd
set -gx fish_color_autosuggestion 6c7086
set -gx fish_color_cancel f38ba8
set -gx fish_color_cwd f9e2af
set -gx fish_color_user 94e2d5
set -gx fish_color_host 89b4fa
set -gx fish_pager_color_progress 6c7086
set -gx fish_pager_color_prefix f5c2e7
set -gx fish_pager_color_completion cdd6f4
set -gx fish_pager_color_description 6c7086

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
set -l rustup_path $HOME/.cargo/bin

set -q CARGO_HOME
and set -l rustup_path $CARGO_HOME/bin

test -d $rustup_path
and contains -- $rustup_path $fish_user_paths
or set fish_user_paths $fish_user_paths $rustup_path
#Prompt
oh-my-posh init fish --config "/home/linuxbrew/.linuxbrew/Cellar/oh-my-posh/current/themes/emodipt-extend.omp.json" | source
