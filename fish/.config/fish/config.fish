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
  set -l rand_choice (random 1 4)
  
  if test $rand_choice = 1
    kitty icat --align=left ~/dotfiles/utils/pictures/robot_small.png
  else if test $rand_choice = 2 
    kitty icat --align=left ~/dotfiles/utils/pictures/fck_pigeon_v2.png
  else if test $rand_choice = 3
    kitty icat --align=left ~/dotfiles/utils/pictures/black_cat_small.png
  else if test $rand_choice = 4
    kitty icat --align=left ~/dotfiles/utils/pictures/fck_pigeon_v1.png
  else
    kitty icat --align=left ~/dotfiles/utils/pictures/tree.png
  end
end

function clear --wraps fish_clear
  command clear
  fish_greeting
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
