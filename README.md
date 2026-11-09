# Dotfiles

Personal configuration files (dotfiles) focused on a modern, productive development environment featuring **Neovim** and **Zsh**.

---

## Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Neovim Configuration](#neovim-configuration)
  - [Key Features](#key-features)
  - [Plugins](#plugins)
  - [Formatting & LSP](#formatting--lsp)
- [Zsh Configuration](#zsh-configuration)
  - [Key Features](#key-features-1)
  - [Plugin Management (Sheldon)](#plugin-management-sheldon)
- [Installation / Setup](#installation--setup)

---

## Overview

- **Neovim**: Fast, modern Lua-based setup bootstrapped with `lazy.nvim`, built-in Neovim 0.11+ LSP configuration (`vim.lsp.enable`/`vim.lsp.config`), formatting with `conform.nvim`, and autocompletion via `blink.cmp`. Also includes VS Code Neovim compatibility.
- **Zsh**: Configured for speed, convenience, and aesthetics using `sheldon` as the plugin manager, Powerlevel10k prompt, fish-like autosuggestions, and syntax highlighting.

---

## Repository Structure

```text
dotfiles/
├── config/
│   ├── nvim/
│   │   ├── init.lua              # Main Neovim configuration & options
│   │   ├── lazy-lock.json        # Pinned plugin versions
│   │   └── lua/
│   │       ├── config/
│   │       │   └── lazy.lua      # lazy.nvim bootstrap & setup
│   │       └── plugins.lua       # Plugin specifications & configurations
│   ├── zsh/
│   │   └── zshrc                 # Main Zsh configuration
│   ├── sheldon/
│   │   └── plugins.toml          # Sheldon plugin manager configuration
│   ├── i3/
│   │   └── config                # i3 window manager configuration
│   └── i3blocks/
│       └── config                # i3blocks bar configuration
└── README.md
```

---

## Neovim Configuration

The Neovim configuration is structured in Lua and handles both standalone Neovim and VS Code (via `vscode-neovim`).

### Key Features

- **Leader Keys**: `<Space>` as `mapleader` and `\` as `maplocalleader`.
- **Editor Options**:
  - Indentation: 4 spaces (`tabstop=4`, `shiftwidth=4`, `expandtab`).
  - Search: Highlighted search (`hlsearch`).
  - UI: Line numbers enabled (`number`), true color support (`termguicolors`), visible whitespace characters (`listchars`), and `exrc` enabled for local project settings.
  - Colorscheme: `habamax.nvim` theme.
- **VS Code Integration**: Lightweight plugin profile (`nvim-autopairs`, `nvim-surround`) when loaded inside VS Code (`vim.g.vscode`).

### Plugins

Managed by [lazy.nvim](https://github.com/folke/lazy.nvim):

| Plugin | Purpose |
| --- | --- |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager (with automatic bootstrapping) |
| [blink.cmp](https://github.com/saghen/blink.cmp) | High-performance completion engine (`super-tab` preset, Rust fuzzy matcher) |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer tree |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Automatic closing of quotes, brackets, and parentheses |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Add, change, and delete surrounding delimiters |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting integration |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations and staging helpers in buffer |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Package manager for external LSP servers, formatters, and linters |
| [typst.vim](https://github.com/kaarmu/typst.vim) & [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim) | Typst document syntax support and live preview |
| [habamax.nvim](https://github.com/ntk148v/habamax.nvim) | Habamax color scheme built with Lush |

### Formatting & LSP

- **LSP**: Configured via native Neovim LSP APIs:
  - Enabled language servers: `lua_ls`, `pyright`, `ts_ls`, `html`, `cssls`, `vimls`, and `tinymist` (Typst).
  - Typst configured with `typstyle` formatter mode, `exportPdf = "onType"`, and `lockDatabase` project resolution.
- **Formatters** (via [conform.nvim](https://github.com/stevearc/conform.nvim)):
  - **Lua**: `stylua`
  - **Python**: `isort` + `black` (executed sequentially)
  - **Rust**: `rustfmt` (with LSP fallback)
  - **JavaScript**: `prettierd` or `prettier` (stops after first available)

---

## Zsh Configuration

The Zsh configuration (`config/zsh/zshrc`) provides an optimized, fast interactive shell.

### Key Features

- **History Management**:
  - Stores up to 1,000,000 commands (`HISTSIZE` and `SAVEHIST`).
  - Shares history across sessions (`share_history`).
  - Duplicates and extra blanks ignored (`hist_ignore_all_dups`, `hist_reduce_blanks`, `hist_save_no_dups`).
  - Incremental history appending (`inc_append_history`).
- **Completion & Navigation**:
  - `compinit` with case-insensitive matching (`m:{a-z}={A-Z}`).
  - Emacs key bindings (`bindkey -e`) with word jumping shortcuts (`Ctrl + Right/Left Arrow`).
- **Environment & Integration**:
  - [NVM (Node Version Manager)](https://github.com/nvm-sh/nvm) loading and bash completion.
  - Path management with duplicate removal (`typeset -U path PATH`), caching `~/.local/bin`.
  - Syntax highlighting for `less` via `source-highlight`.
  - Convenient aliases (`ls`, `ll`, `la`, `lh` with colored output).

### Plugin Management (Sheldon)

Plugins are managed through [sheldon](https://github.com/rossmacarthur/sheldon) configured in `config/sheldon/plugins.toml`:

- **[powerlevel10k](https://github.com/romkatv/powerlevel10k)**: Fast and customizable prompt theme (configured with instant prompt enabled).
- **[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)**: Fish-like autosuggestions based on command history.
- **[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)**: Fish-like syntax highlighting for the command line.

---

## Installation / Setup

Symlink the configurations to your `~/.config` and home directory:

```bash
# Clone the repository
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles

# Neovim
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/config/nvim/* ~/.config/nvim/

# Zsh
ln -s ~/dotfiles/config/zsh/zshrc ~/.zshrc

# Sheldon
mkdir -p ~/.config/sheldon
ln -s ~/dotfiles/config/sheldon/plugins.toml ~/.config/sheldon/plugins.toml
```

> [!NOTE]
> Ensure you have [sheldon](https://github.com/rossmacarthur/sheldon) installed for Zsh plugin management and a Nerd Font installed for terminal icons and powerlevel10k prompt elements.
