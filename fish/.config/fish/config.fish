if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
end

alias vim=nvim
alias ls="lsd -F"
alias la="lsd -AF"
alias ll="lsd -lAF"
alias lg="lsd -F --group-dirs=first"
alias tree="lsd -AF --tree"
alias zl="z && ll"

set -gx EDITOR nvim
set -gx JAVA_HOME (/usr/libexec/java_home -v 1.8.0)

set fish_color_command brcyan
set fish_color_normal cyan
set fish_color_autosuggestion 7f849c --italics

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
    kitty icat --align=left $random_image
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
