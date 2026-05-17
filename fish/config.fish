if status is-interactive
# Commands to run in interactive sessions can go here
end

set -gx PATH "$HOME/.local/bin" $PATH

# opencode
fish_add_path /Users/paulogdm/.opencode/bin

# pnpm
set -gx PNPM_HOME "/Users/paulogdm/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
