# Zed

Tracked:

- `settings.json`: symlinked to `~/.config/zed/settings.json` by `install.sh`.
- `extensions.txt`: installed extension IDs captured from `~/Library/Application Support/Zed/extensions/installed`.

Not tracked:

- Prompt databases, local app databases, language servers, extension payloads, and cache files.

## Restore extensions

`settings.json` defines `auto_install_extensions` for the IDs in `extensions.txt`.
After `install.sh` symlinks the settings file, launch or restart Zed and it will install the missing extensions on startup.
