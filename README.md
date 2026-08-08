# Neovim Configuration

A clean, modular, production-ready Neovim configuration built for modern software development on Arch Linux (Hyprland / Wayland / Kitty / Fish).

Targeted specifically for Neovim 0.12.x, emphasizing speed, reliability, native APIs, and low visual clutter.

---

## Features

- Fast Startup: Under 90ms cold start time with lazy loading powered by lazy.nvim.
- Native Neovim 0.12 LSP: Managed via mason.nvim and mason-lspconfig.nvim using modern vim.lsp.config & vim.lsp.enable APIs.
- Next-Gen Completion: Powered by blink.cmp v2 with C/Rust accelerated fuzzy matching and native vim.snippet support.
- Modern Treesitter: Built on nvim-treesitter (main branch) using native vim.treesitter.start().
- Blazing Search: fzf-lua for files, live grep, buffers, symbols, and diagnostics.
- Minimal UI: Modern Kanagawa colorscheme, custom dashboard & notification center via snacks.nvim, and clean lualine.
- Formatting & Linting: conform.nvim with format-on-save + nvim-lint for shell linters.
- Git Integration: gitsigns.nvim for inline hunks, blame, and float LazyGit support.
- Buffer File Management: oil.nvim for directory editing directly inside Vim buffers.
- Debugger (DAP): Lazy-loaded nvim-dap & nvim-dap-ui for Python, Go, Rust, C/C++, and Node.js.

---

## Quick Start

```bash
# Launch Neovim
nvim
```

On first launch, lazy.nvim automatically installs plugins, compiles Treesitter language parsers, and Mason provisions language servers on demand.

---

## Documentation Index

All detailed guides and documentation files are organized inside the [docs/](docs/) directory:

- [docs/Introduction.md](docs/Introduction.md) - Detailed introduction, core philosophy, and complete plugin stack.
- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) - Project structure, module layout, and design rationale.
- [docs/KEYMAPS.md](docs/KEYMAPS.md) - Complete keybinding reference table (Leader = Space).
- [docs/DEPENDENCIES.md](docs/DEPENDENCIES.md) - Required and optional system CLI dependencies guide.
- [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) - Health checks, common errors, and diagnostic steps.
