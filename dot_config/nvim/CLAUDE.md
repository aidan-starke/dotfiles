# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration. LazyVim is a Neovim starter template built on top of lazy.nvim plugin manager.

## Architecture

### Directory Structure

- `init.lua` - Entry point that bootstraps LazyVim by requiring `config.lazy`
- `lua/config/` - Core configuration files
  - `lazy.lua` - Plugin manager setup and LazyVim initialization
  - `options.lua` - Editor options (tabs use real tabs with width 3, no swap files, etc.)
  - `keymaps.lua` - Custom keymaps (beyond LazyVim defaults)
  - `autocmds.lua` - Custom autocommands
- `lua/plugins/` - Plugin specifications
  - `mine.lua` - Additional plugins (Harpoon, Hop, nvim-surround, wildfire, scrollEOF, render-markdown, vim-sleuth)
  - `override.lua` - LazyVim plugin overrides (Codeium, Snacks picker/explorer, ESLint, conform)
  - `disabled.lua` - Disabled LazyVim plugins (bufferline, flash, CopilotChat, neo-tree, etc.)
  - `theme.lua` - Color scheme configuration
- `lua/setup/` - Utility modules
  - `keymap.lua` - Keymap binding helpers (nnoremap, vnoremap, etc.)
  - `helpers.lua` - General helper functions (merge_tables, set_keymaps)
- `plugin/after/` - Plugin configurations that load after plugins initialize
  - `harpoon.lua` - Harpoon 2 setup with NeoTree integration
  - `hop.lua` - Hop navigation setup
  - `transparency.lua` - Transparent background configuration

### Key Configuration Details

**Plugin Management:**
- Uses lazy.nvim with LazyVim as the base configuration
- Custom plugins defined in `lua/plugins/*.lua` are automatically imported
- Plugins default to eager loading (`lazy = false`)
- Plugin updates are checked automatically but notifications are disabled

**Editor Preferences:**
- Uses vim-sleuth for automatic indentation detection (no hardcoded tab settings)
- Line numbers shown with relative numbering
- Clipboard integration with system clipboard (`unnamedplus`)
- No swap files
- Custom status column with relative line numbers
- Word wrap enabled
- Scroll offset of 15 lines
- No search highlighting, incremental search enabled

**Keymap Utilities:**
- `lua/setup/keymap.lua` provides binding functions: `nnoremap`, `vnoremap`, `xnoremap`, `inoremap`, `remap`, `nmap`
- `lua/setup/helpers.lua` provides `set_keymaps(bind_fn, pairs, opts)` for batch keymap registration
- Pattern: `set_keymaps(nnoremap, {{key, fn}, {key2, fn2}}, {silent = true})`

**Plugin Customizations:**
- Codeium: Virtual text enabled with Tab to accept, Alt+] for next suggestion, Alt+[ for previous
- Snacks Picker:
  - Default focus on list, except for files/grep/config/select sources which focus input
  - Explorer source shows hidden files and auto-closes after file selection
- ESLint: Only starts when a config file is found (configured via root_dir override in `lua/plugins/override.lua`)
- Conform (formatting):
  - C#: Uses csharpier formatter
  - Prettier: Runs without requiring config file (`lazyvim_prettier_needs_config = false`)
- vim-sleuth: Auto-detects indentation from file content
- Harpoon 2: Excludes `harpoon` and `snacks_picker_list` filetypes, auto-saves on toggle
  - `<leader>hx` - Add file to harpoon
  - `<leader>hm` - Toggle harpoon menu
  - `<leader>hn` - Next harpoon file (wraps around)
  - `<leader>hp` - Previous harpoon file (wraps around)
- Hop: Character-based navigation (f/F/t/T variants with leader key)
  - `<leader>f` - Hop forward to character
  - `<leader>F` - Hop backward to character
  - `<leader>t` - Hop forward before character
  - `<leader>T` - Hop backward before character
- mini.ai: Uses LazyVim's default configuration (treesitter-based text objects)
  - `o` - code blocks, conditionals, loops (treesitter)
  - `f` - functions (treesitter)
  - `c` - classes (treesitter)
  - `t` - HTML/XML tags
  - `d` - digits
  - `e` - word with case
  - `g` - whole buffer
  - `u/U` - function calls
- render-markdown: Lazy-loads only for markdown files

**Custom Keymaps:**
- `<leader>sa` - Select all (gg<S-v>G)
- `U` - Redo (mapped to Ctrl-r)
- `J/K` in visual mode - Move selected lines down/up
- `<leader>p` in visual mode - Paste without yanking replaced text

**LSP Customizations:**
- OmniSharp (C#): Semantic tokens disabled via autocmd

## Adding New Plugins

1. Create a new file in `lua/plugins/` or add to existing plugin files
2. Return a table with plugin specifications following lazy.nvim format
3. For plugins needing setup after initialization, create configuration in `plugin/after/`
4. Use the keymap utilities (`lua/setup/keymap.lua` and `lua/setup/helpers.lua`) for consistent keymap registration

## Modifying LazyVim Defaults

- Override plugin configs in `lua/plugins/override.lua`
- Disable unwanted LazyVim extras in `lua/plugins/disabled.lua`
- Add custom options in `lua/config/options.lua`
- Add custom keymaps in `lua/config/keymaps.lua`
- Add custom autocmds in `lua/config/autocmds.lua`

## LazyVim Extras

Enabled extras (from `lazyvim.json`):
- AI: Codeium
- Coding: Yanky (yank history)
- Editor: inc-rename, Snacks explorer
- Formatting: Prettier
- Languages: Docker, Git, JSON, Markdown, OmniSharp (C#), Prisma, Rust, Tailwind, TypeScript, YAML
- Linting: ESLint
- Utilities: dot, mini-hipatterns

## Special Notes

- Transparency: All background colors are set to `none` in `plugin/after/transparency.lua` for terminal transparency (includes Snacks picker, Notify, etc.)
- Theme: Uses TokyoNight with custom highlight overrides (keywords: blue5, comments: #636da6, custom line numbers)
- `theme.lua` is a symlink to `/home/aidan/.config/omarchy/current/theme/neovim.lua`
- LazyVim's mini.ai is used instead of custom configuration - provides treesitter-based text objects that work across all languages
