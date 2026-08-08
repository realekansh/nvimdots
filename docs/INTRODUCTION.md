# Neovim Configuration

A minimal, production-quality Neovim configuration targeting Neovim 0.12.x on Arch Linux (Hyprland / Kitty / Fish).

Built for software development with first-class support for Python, Lua, Bash, Rust, Go, C/C++, JavaScript/TypeScript, HTML, CSS, JSON, YAML, TOML, and Markdown.

## Core Philosophy

1. **Minimal Complexity & Maximum Productivity**: Native Neovim features used wherever sufficient.
2. **Real Value**: Every plugin solves a concrete problem without bloat or excessive visual noise.
3. **No Legacy APIs**: Built entirely around modern Neovim 0.12 APIs (`vim.lsp.config`, `vim.lsp.enable`, `vim.snippet`, rewritten `nvim-treesitter` on `main` branch).
4. **Resilient**: Gracefully handles missing optional tools (e.g. lazygit, delve, codelldb) without runtime errors.
5. **Fast**: Sub-100ms startup time with clean lazy loading.

## Quick Start

```bash
# Launch Neovim
nvim
```

Lazy.nvim auto-bootstraps on first launch, installs plugins, compiles Treesitter parsers, and Mason sets up language servers seamlessly.

## Key Plugin Stack

- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Colorscheme**: [Kanagawa](https://github.com/rebelot/kanagawa.nvim) (Wave dark theme)
- **Fuzzy Finder**: [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- **Completion**: [blink.cmp](https://github.com/Saghen/blink.cmp) v2 + `saghen/blink.lib`
- **LSP**: Native Neovim 0.12 LSP + [mason.nvim](https://github.com/mason-org/mason.nvim) & [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)
- **Treesitter**: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`main` branch)
- **Formatting**: [conform.nvim](https://github.com/stevearc/conform.nvim) (Format on save enabled, toggleable)
- **Linting**: [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- **Git**: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) & LazyGit float integration
- **File Management**: [oil.nvim](https://github.com/stevearc/oil.nvim)
- **UI & Utilities**: [snacks.nvim](https://github.com/folke/snacks.nvim) (Dashboard, Notifier, Indent, Floating/Split Terminals, Scratch) & [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- **Debugging**: [nvim-dap](https://github.com/mfussenegger/nvim-dap) & [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

## Keymap Quick Reference

| Key | Action |
|---|---|
| `<Space>` | Leader key |
| `<leader>ff` | Find files (`fzf-lua`) |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find open buffers |
| `<leader>fr` | Recent files |
| `<leader>e` / `[d` / `]d` | Diagnostic hover / Prev / Next |
| `gd` / `gr` / `K` | Definition / References / Hover |
| `<leader>ca` / `<leader>cr` | Code actions / Rename |
| `<leader>cf` | Format current buffer |
| `<C-/>` | Toggle floating terminal |
| `-` | Open file directory buffer (`oil.nvim`) |
| `<leader>gg` | Open LazyGit float |

For a complete list of keymaps, see [KEYMAPS.md](KEYMAPS.md).

## Language Support

| Language | LSP Server | Formatter | Linters / Extra |
|---|---|---|---|
| **Python** | `pyright` | `ruff_format` | Debugging via `debugpy` |
| **Lua** | `lua_ls` | `stylua` | Neovim runtime types |
| **Bash** | `bashls` | `shfmt` | `shellcheck` |
| **Rust** | `rust_analyzer` | `rustfmt` | Inlay hints & Clippy |
| **Go** | `gopls` | `goimports`, `gofmt` | Debugging via `delve` |
| **C / C++** | `clangd` | `clang-format` | `clang-tidy` integration |
| **JS / TS** | `vtsls` | `prettierd` / `prettier` | Inlay hints |
| **JSON / YAML / TOML** | `jsonls`, `yamlls`, `taplo` | `prettierd`, `taplo` | Schema validation |
| **HTML / CSS** | `html`, `cssls` | `prettierd` | — |
| **Markdown** | `marksman` | `prettierd` | Conceal & spellcheck |

## Documentation

- [ARCHITECTURE.md](ARCHITECTURE.md) - Modular architecture details & design rationale.
- [KEYMAPS.md](KEYMAPS.md) - Comprehensive list of default & leader keybindings.
- [DEPENDENCIES.md](DEPENDENCIES.md) - System requirements and package dependencies.
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Common health check steps and diagnostic guide.
