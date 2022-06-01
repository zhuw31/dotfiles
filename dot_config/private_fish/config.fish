if status is-interactive
    # Commands to run in interactive sessions can go here
  starship init fish | source

  set -gx fish_greeting
  set -gx EDITOR nvim
end
