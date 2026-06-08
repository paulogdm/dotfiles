if status is-interactive
# Commands to run in interactive sessions can go here
end

set -gx PATH "$HOME/.local/bin" $PATH

# opencode
fish_add_path /Users/paulogdm/.opencode/bin

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
  fish_add_path "$PNPM_HOME/bin"
end
# pnpm end
