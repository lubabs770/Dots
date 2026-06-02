# Dots

My macOS dotfiles (alacritty, btop, nvim, yabai, skhd, yazi, zed, zsh, iTerm2, VS Code, Homebrew Brewfile).

## Install

On a fresh machine:

```bash
curl -fsSL https://raw.githubusercontent.com/lubabs770/Dots/main/install.sh | bash
```

The installer:

1. Ensures `git` and Homebrew are present (installs Homebrew if missing).

3. Clones this repo to a temp dir.

5. Copies the dotfiles into `$HOME`, backing up anything it would overwrite to
   `~/.dotfiles-backup/<timestamp>/`.
   
6. Restores VS Code settings/keybindings and installs the listed extensions
   (if the `code` CLI is on your PATH).
   
7. Runs `brew bundle` against the bundled `Brewfile`.

8. Restart your shell (`exec zsh`) when it finishes.

## Notes

- **Redacted placeholders.** A few files are committed with `<redacted>`
  placeholder content because they hold secrets or machine-specific data:
  `.claude.json`, `.config/gh/hosts.yml`, `.config/linear/credentials.toml`,
  `.config/finicky/finicky.js`, `.config/iterm2/AppSupport/EnableAI.secureSetting`,
  and `.config/.mono/`. The installer still places them (and warns when it does) —
  you must fill in real values manually afterward, e.g. re-auth `gh`, re-link
  Linear, and rebuild your Finicky config.

  
- **Empty submodule dirs.** The yazi flavors (`everforest-medium`, `gruvbox-dark`,
  `kanagawa`, `nord`, `tokyo-night`) and the `aphrodite` zsh theme are stored as
  bare submodule references with no content, so they are not restored. The
  installer reports them at the end; clone them from their upstreams if needed.

  

## Structure

~/.config -> tree . ->
```
.
├── 2026-06-02T17-45-03-0400_dots_backup.zip
├── alacritty
│   ├── alacritty.toml
│   └── themes
│       ├── catppuccin_frappe.toml
│       ├── current.toml
│       ├── everforest_dark.toml
│       ├── gruvbox_dark.toml
│       ├── kanagawa_wave.toml
│       ├── nord.toml
│       ├── rose_pine.toml
│       └── tokyo_night.toml
├── borders
│   ├── active_color
│   └── bordersrc
├── btop
│   ├── btop.conf
│   └── themes
│       ├── catppuccin-frappe.theme
│       ├── everforest.theme
│       ├── gruvbox.theme
│       ├── kanagawa.theme
│       ├── Nord.theme
│       ├── rose-pine.theme
│       └── tokyo-night.theme
├── bundle_dots.sh
├── cagent
│   └── user-uuid
├── configstore
│   └── update-notifier-netlify-cli.json
├── finicky
│   └── finicky.js
├── gh
│   ├── config.yml
│   └── hosts.yml
├── git
│   └── ignore
├── iterm2
│   ├── AppSupport -> /Users/<redacted>/Library/Application Support/iTerm2
│   └── sockets
│       └── secrets
├── linear
│   └── credentials.toml
├── neofetch
│   └── config.conf
├── nvim
│   ├── colors
│   │   └── passthrough.lua
│   ├── init.lua
│   ├── lazy-lock.json
│   ├── lua
│   │   ├── community.lua
│   │   ├── lazy_setup.lua
│   │   ├── plugins
│   │   │   ├── astrocore.lua
│   │   │   ├── astrolsp.lua
│   │   │   ├── astroui.lua
│   │   │   ├── mason.lua
│   │   │   ├── neo-tree.lua
│   │   │   ├── none-ls.lua
│   │   │   ├── themes.lua
│   │   │   ├── treesitter.lua
│   │   │   └── user.lua
│   │   └── polish.lua
│   ├── neovim.yml
│   ├── README.md
│   └── selene.toml
├── skhd
│   └── skhdrc
├── sunshine
├── sunshine-bootstrap
├── sunshine-iterm-presets
│   ├── Everforest.itermcolors
│   ├── Kanagawa.itermcolors
│   ├── Nord.itermcolors
│   └── Rosé Pine.itermcolors
├── sunshine-theme
├── yabai
│   ├── cycle-focus.py
│   └── resize-smart.sh
├── yazi
│   ├── flavors
│   │   ├── catppuccin-frappe.yazi
│   │   │   ├── flavor.toml
│   │   │   ├── LICENSE
│   │   │   ├── LICENSE-tmtheme
│   │   │   ├── preview.png
│   │   │   ├── README.md
│   │   │   └── tmtheme.xml
│   │   ├── everforest-medium.yazi
│   │   │   ├── flavor.toml
│   │   │   ├── LICENSE
│   │   │   ├── LICENSE-tmtheme
│   │   │   ├── preview.png
│   │   │   ├── README.md
│   │   │   └── tmtheme.xml
│   │   ├── gruvbox-dark.yazi
│   │   │   ├── flavor.toml
│   │   │   ├── LICENSE
│   │   │   ├── LICENSE-tmtheme
│   │   │   ├── preview.png
│   │   │   ├── README.md
│   │   │   └── tmtheme.xml
│   │   ├── kanagawa.yazi
│   │   │   ├── flavor.toml
│   │   │   ├── LICENSE
│   │   │   ├── LICENSE-tmtheme
│   │   │   ├── preview.png
│   │   │   ├── README.md
│   │   │   └── tmtheme.xml
│   │   ├── nord.yazi
│   │   │   ├── flavor.toml
│   │   │   ├── LICENSE
│   │   │   ├── LICENSE-tmtheme
│   │   │   ├── preview.png
│   │   │   ├── README.md
│   │   │   └── tmtheme.xml
│   │   ├── rose-pine.yazi
│   │   │   ├── flavor.toml
│   │   │   └── tmtheme.xml
│   │   └── tokyo-night.yazi
│   │       ├── flavor.toml
│   │       ├── LICENSE
│   │       ├── LICENSE-tmtheme
│   │       ├── preview.png
│   │       ├── README.md
│   │       └── tmtheme.xml
│   ├── init.lua
│   ├── keymap.toml
│   ├── package.toml
│   ├── plugins
│   │   ├── no-status.yazi
│   │   │   ├── LICENSE
│   │   │   ├── main.lua
│   │   │   └── README.md
│   │   ├── preview-toggle.yazi
│   │   │   └── main.lua
│   │   ├── smart-enter.yazi
│   │   │   ├── LICENSE
│   │   │   ├── main.lua
│   │   │   └── README.md
│   │   └── toggle-pane.yazi
│   │       ├── LICENSE
│   │       ├── main.lua
│   │       └── README.md
│   ├── theme.toml
│   └── yazi.toml
└── zed
    ├── keymap.json
    ├── prompts
    │   └── prompts-library-db.0.mdb
    │       ├── data.mdb
    │       └── lock.mdb
    ├── settings.json
    └── themes
        ├── frosted-glass.json
        └── github dark dimmed.json

41 directories, 117 files
```

relavent in ~/
```
.iterm2
.zsh
.hushlogin
.yabairc
.zshrc
```
