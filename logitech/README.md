# Logitech Options+

## What's tracked

| File | What it controls |
|------|-----------------|
| `cc_config.json` | UI theme (dark mode) |

## What can't be tracked

Button mappings, pointer speed, scroll settings, and macros are stored in binary SQLite databases (`settings.db`, `macros.db`) inside `~/Library/Application Support/LogiOptionsPlus/`. There is no official export feature.

## Install

`logi-options+` is included in the Brewfile and will be installed automatically by `install.sh`.

## Restore cc_config.json

```bash
cp logitech/cc_config.json ~/Library/Application\ Support/LogiOptionsPlus/cc_config.json
```

## Manual settings to re-apply after a fresh install

Document your device settings here so you can recreate them:

- **Device**: MX Master 3 (or whichever you use)
- **Scroll wheel**: (note direction / speed)
- **Thumb buttons**: (note what each is mapped to)
- **Pointer speed**: (note your preference)
- **Flow**: (note linked machines, if any)
