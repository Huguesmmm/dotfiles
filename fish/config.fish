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

function fish_greeting
  if test (random 1 2) = 1; colorscript -e 11; else; colorscript -e elfman; end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
