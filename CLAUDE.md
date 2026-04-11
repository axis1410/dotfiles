# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository managed with [GNU Stow](https://formulae.brew.sh/formula/stow). Running `stow .` from the repo root creates symlinks from `~/` to everything here, mirroring the directory structure exactly.

## Applying Changes

```bash
# Re-run stow from the repo root to pick up new files/directories
stow .

# Reload zsh config (alias defined in .zshrc)
zsh

# Reload tmux config (inside a tmux session)
<prefix> r   # i.e. C-a r
```

## Repository Structure

| Path | What it configures |
|---|---|
| `.zshrc` | Zsh shell — aliases, functions, PATH, plugins, zoxide |
| `.config/nvim/` | Neovim — Lua config via lazy.nvim |
| `.config/tmux/tmux.conf` | Tmux — prefix is `C-a`, pane-base-index 1 |
| `.config/ghostty/config` | Ghostty terminal |
| `.config/starship.toml` | Starship prompt |
| `.config/yazi/` | Yazi file manager |
| `.wezterm.lua` | WezTerm (legacy/backup terminal config) |

## Neovim Architecture

Config lives in `.config/nvim/lua/core/`:

- `init.lua` — entry point, loads `core.*` modules
- `lazy.lua` — bootstraps lazy.nvim, imports all plugins from `core/plugins/`
- `options.lua` / `mappings.lua` / `autocmds.lua` — editor settings, keymaps, autocommands
- `globals.lua` / `jb_palette.lua` — global helpers and JetBrains-style color palette
- `core/plugins/` — one file per plugin; each file returns a lazy.nvim plugin spec

The colorscheme is persisted across sessions via `colorscheme.apply_saved()` (called after lazy setup). The theme module lives at `.config/nvim/theme.lua` and is gitignored to allow local overrides.

**Adding a plugin:** create a new file in `core/plugins/` returning a valid lazy.nvim spec — it is auto-imported.

## Tmux Key Bindings

- Prefix: `C-a`
- `|` / `-` — split horizontal / vertical
- `h/j/k/l` — navigate panes (also works via vim-tmux-navigator)
- `H/J/K/L` — resize panes
- `m` — zoom/unzoom pane
- `b` — toggle status bar

## Notable Zsh Functions

- `nic [session]` — open a coding layout: nvim (70%) + claude (30%) side-by-side in the current directory; works both inside and outside an existing tmux session
- `bsetup <site> <backup>` — Frappe/ERPNext site setup from backup with encryption key handling
- `gtag <version> <message>` / `gtagd <version>` — create/delete annotated git tags with remote push
- `extract <archive> <dest>` — extract any archive format to a destination directory
