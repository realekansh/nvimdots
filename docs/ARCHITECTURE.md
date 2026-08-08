# Configuration Architecture

```
~/.config/nvim/
├── init.lua                    # Entry point: leader key, plugin bootstrap, runtime optimization
├── lazy-lock.json              # Reproducible plugin version lockfile
├── .gitignore                  # Git exclusions for cache, shada, & temporary files
├── README.md                   # Overview, features, and docs directory index
│
├── docs/                       # Comprehensive documentation
│   ├── Introduction.md         # Detailed overview & key stack
│   ├── ARCHITECTURE.md         # Structural layout & principles
│   ├── KEYMAPS.md              # Complete keymap reference
│   ├── DEPENDENCIES.md         # Required & optional tools
│   └── TROUBLESHOOTING.md      # Diagnostics & health checks
│
├── lua/
│   ├── config/                 # Pure Neovim core configurations (No plugin dependencies)
│   │   ├── options.lua         # Editor settings (indentation, line numbers, splits, foldexpr)
│   │   ├── keymaps.lua         # Core navigation, window resizing, and movement maps
│   │   ├── autocmds.lua        # Guarded autocommands (yank highlight, cursor restore, whitespace)
│   │   ├── diagnostics.lua     # Diagnostic display settings (virtual text, icons, borders)
│   │   └── commands.lua        # Custom user commands (:DiagnosticsToggle, :InlayHintsToggle)
│   │
│   ├── plugins/                # Modular lazy.nvim specifications
│   │   ├── treesitter.lua      # Syntax parsing & highlighting via nvim-treesitter (main branch)
│   │   ├── lsp.lua             # Native Neovim 0.12 LSP configs + Mason & mason-lspconfig
│   │   ├── completion.lua      # blink.cmp v2 setup with native vim.snippet engine
│   │   ├── finder.lua          # fzf-lua picker configuration & vim.ui.select replacement
│   │   ├── git.lua             # gitsigns.nvim hunk staging, blame, and diff navigation
│   │   ├── formatting.lua      # conform.nvim formatters & format-on-save autocommand
│   │   ├── linting.lua         # nvim-lint CLI linter triggers
│   │   ├── debugging.lua       # nvim-dap lazy debug configurations (Python, Go, Rust, C/C++)
│   │   ├── terminal.lua        # Floating/Split terminals via snacks.terminal
│   │   ├── editor.lua          # oil.nvim, which-key, todo-comments, autopairs, surround
│   │   └── ui.lua              # Kanagawa theme, snacks.nvim UI (dashboard/notifier), lualine
│   │
│   └── utils/                  # Utility helper modules
│       ├── helpers.lua         # Safe require, executable checks, root detection
│       └── system.lua          # Dependency validation & health checks
│
└── after/ftplugin/             # Filetype-specific settings (python, lua, go, rust, ts, etc.)
    ├── c.lua
    ├── cpp.lua
    ├── css.lua
    ├── go.lua
    ├── html.lua
    ├── javascript.lua
    ├── json.lua
    ├── lua.lua
    ├── markdown.lua
    ├── python.lua
    ├── rust.lua
    ├── typescript.lua
    └── yaml.lua
```

## Architectural Principles

1. **Separation of Concerns**: Core settings (`lua/config/`) are completely decoupled from plugin specifications (`lua/plugins/`).
2. **Buffer Safety Guards**: Every autocmd that touches file buffers checks `is_real_file(buf)` to prevent errors on unnamed buffers, prompt buffers, terminals, or `[No Name]` scratchpads.
3. **Graceful Degradation**: Features requiring external executables (like `lazygit`, `dlv`, `codelldb`, `ripgrep`) check for binary existence using `vim.fn.executable()` before attempting initialization.
4. **Modern APIs**: Uses Neovim 0.12 native features:
   - `vim.lsp.config` & `vim.lsp.enable`
   - `vim.snippet` native engine
   - `vim.treesitter.start()` & `vim.treesitter.foldexpr()`
