if status is-interactive
# Commands to run in interactive sessions can go here
end

set -gx PATH "$HOME/.local/bin" $PATH

# opencode
fish_add_path "$HOME/.opencode/bin"

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path "$PNPM_HOME/bin" "$PNPM_HOME"
# pnpm end
