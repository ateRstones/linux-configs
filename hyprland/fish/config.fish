if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

starship init fish | source
if test -f ~/.config/fish/git.fish
    source ~/.config/fish/git.fish
end

# Custom scripts etc
set -gx SHELL_HELPERS_FOLDER "$HOME/Documents/git/shell-helpers"
if test -f $SHELL_HELPERS_FOLDER/flux.fish
    source $SHELL_HELPERS_FOLDER/flux.fish
end
if test -f $SHELL_HELPERS_FOLDER/kubectl.fish
    source $SHELL_HELPERS_FOLDER/kubectl.fish
end
if test -f $SHELL_HELPERS_FOLDER/git-infrastructure.fish
    source $SHELL_HELPERS_FOLDER/git-infrastructure.fish
end
if test -f $SHELL_HELPERS_FOLDER/general-helpers.fish
    source $SHELL_HELPERS_FOLDER/general-helpers.fish
end
