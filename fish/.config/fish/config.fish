if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
end

alias vim=nvim

# Aliases for lsd, uncomment if you don't want to use eza
# alias ls="lsd -F"
# alias la="lsd -AF"
# alias ll="lsd -lAF"
# alias lg="lsd -F --group-dirs=first"
# alias tree="lsd -AF --tree"

set -gx EDITOR nvim
set -gx JAVA_HOME (/usr/libexec/java_home -v 1.8.0)

set fish_color_command brcyan
set fish_color_normal cyan
set fish_color_autosuggestion 7f849c --italics

abbr -a --position anywhere -- --help '--help | bat -plhelp'
abbr -a --position anywhere -- -h '-h | bat -plhelp'

function fzf_preview_simple
  set -l item $argv[1]

  if test -f "$item"
    bat --color=always --style=numbers --line-range=:500 "$item"
  else
    ls -F --color=always "$item" | head -n 50
  end
end

set -gx FZF_DEFAULT_OPTS "
  --color=bg+:#25394D,bg:-1,spinner:#F5E0DC,hl:#F38BA8 \
  --color=fg:#CDD6F4,header:#F38BA8,info:#F5E0DC,pointer:#F5E0DC \
  --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#F5E0DC,hl+:#F38BA8 \
  --color=selected-bg:#45475A \
  --color=border:#25394D,label:#CDD6F4,gutter:-1
  --no-border
  --preview-window noborder
  --margin=1
  --padding=2
  --layout=reverse
  --preview='fzf_preview_simple {}'
" 

# function fish_greeting
#   if test (random 1 3) = 1
#     colorscript -e 11 
#   else if test (random 1 3) = 2 
#     colorscript -e elfman 
#   else 
#     colorscript -e bloks  
#   end
# end

function fish_greeting
  if string match -q "xterm-kitty" $TERM
    set -l images ~/dotfiles/utils/pictures/robot_small.png \
      ~/dotfiles/utils/pictures/fck_pigeon_v2.png \
      ~/dotfiles/utils/pictures/black_cat_small.png \
      ~/dotfiles/utils/pictures/fck_pigeon_v1.png \
      ~/dotfiles/utils/pictures/tree.png

    # Pick one image from the list at random
    set -l random_image (random choice $images)

    # Display the chosen image
    kitty icat --clear --z-index 1 --align=left $random_image
  else if string match -q "alacritty" $TERM
    colorscript -e bloks
  end
end

function clear --wraps fish_clear
  command clear
  if string match -q "xterm-kitty" $TERM
    fish_greeting
  end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
