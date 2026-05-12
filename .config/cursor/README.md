# Cursor config

This folder tracks Cursor user configuration in git.

## Backup Existing Config

If you already have Cursor config on this machine, back it up before linking:

```sh
CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"
BACKUP_DIR="$HOME/cursor-config-backup-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$BACKUP_DIR"

mv "$CURSOR_USER_DIR/settings.json" "$BACKUP_DIR/" 2>/dev/null || true
mv "$CURSOR_USER_DIR/keybindings.json" "$BACKUP_DIR/" 2>/dev/null || true
mv "$CURSOR_USER_DIR/snippets" "$BACKUP_DIR/" 2>/dev/null || true
```

Then run the install commands below.

## Install

Cursor stores user config here on macOS:

```sh
~/Library/Application\ Support/Cursor/User/
```

From the root of this dotfiles repo, create symlinks into Cursor's user config
directory:

```sh
CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"
DOTFILES_CURSOR_DIR="$HOME/dotfiles/.config/cursor"

if [ ! -d "$CURSOR_USER_DIR" ]; then
  echo "Cursor user config directory does not exist: $CURSOR_USER_DIR" >&2
  echo "Open Cursor once, then run this setup again." >&2
  exit 1
fi

ln -sfn "$DOTFILES_CURSOR_DIR/settings.json" "$CURSOR_USER_DIR/settings.json"
ln -sfn "$DOTFILES_CURSOR_DIR/keybindings.json" "$CURSOR_USER_DIR/keybindings.json"
ln -sfn "$DOTFILES_CURSOR_DIR/snippets" "$CURSOR_USER_DIR/snippets"
```

If this repository lives somewhere other than `~/dotfiles`, update
`DOTFILES_CURSOR_DIR` before running the commands.

## Tracked Files

- `settings.json` maps to Cursor user settings.
- `keybindings.json` maps to Cursor keyboard shortcuts.
- `snippets/` maps to Cursor user snippets.
