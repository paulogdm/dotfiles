# dotfiles

Personal configuration files for macOS.

## What's tracked

| App | Location | Notes |
|-----|----------|-------|
| Fish Shell | `fish/` | config.fish, fish_plugins, conf.d |
| Git | `git/gitconfig` | Aliases and identity (no credentials) |
| Homebrew | `brew/Brewfile` | All formulae and casks |
| Logitech Options+ | `logitech/` | UI theme; button mappings can't be exported |
| Raycast | `raycast/README.md` | Settings sync via Raycast account |
| CleanShot X | `cleanshot/README.md` | Manual setup guide (no license stored) |

## Install

```bash
git clone https://github.com/paulogdm/dotfiles ~/code/dotfiles
cd ~/code/dotfiles
chmod +x install.sh
./install.sh
```

`install.sh` creates symlinks from this repo into the expected config locations and runs `fisher update` to restore Fish plugins.

## Adding new configs

1. Copy the config file into the appropriate folder in this repo.
2. Add the symlink to `install.sh`.
3. Make sure no secrets are included — check `.gitignore`.

## What's intentionally NOT tracked

- App license keys
- API tokens / secrets
- Raycast encrypted databases
- CleanShot preferences plist (contains license)
- `fish_variables` (contains Fisher internals; Fisher restores it via `fish_plugins`)
- Logitech button mappings and macros (binary SQLite, no official export)
