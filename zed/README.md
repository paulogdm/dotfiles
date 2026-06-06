# Zed

Tracked:

- `settings.json`: symlinked to `~/.config/zed/settings.json` by `install.sh`.
- `extensions.txt`: installed extension IDs captured from `~/Library/Application Support/Zed/extensions/installed`.

Not tracked:

- Prompt databases, local app databases, language servers, extension payloads, and cache files.

## Restore extensions

Zed's bundled CLI opens files and projects, but does not currently expose an extension install command on this machine. Reinstall these from Zed's Extensions panel using the IDs in `extensions.txt`.
