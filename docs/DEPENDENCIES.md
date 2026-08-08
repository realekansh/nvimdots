# External Dependencies

This Neovim configuration requires minimal system-level tools and automatically detects available CLI tools to degrade functionality gracefully without raising errors.

## Mandatory Core Dependencies

These programs must be available on your system path for Neovim and its plugin manager to function:

- **Neovim** (>= 0.12.0)
- **git** (Plugin management & Git status)
- **curl** (Mason package downloads)
- **gcc** or **clang** (C compiler for compiling Treesitter parsers)
- **tree-sitter-cli** (Parser compilation helper)

### Arch Linux Quick Installation
```bash
sudo pacman -S neovim git curl gcc tree-sitter-cli
```

---

## Recommended Tools (Fuzzy Finding & Previews)

These binaries power fzf-lua search and previews:

- **fd**: Fast file finder (replaces find)
- **ripgrep** (`rg`): High-performance search tool (replaces grep)
- **fzf**: Command-line fuzzy finder binary
- **bat**: Syntax highlighting pager for previews

### Arch Linux Quick Installation
```bash
sudo pacman -S fd ripgrep fzf bat
```

---

## Language Ecosystem Runtimes

Required for installing and running language servers via Mason:

- **Python** (`python`, `python3`)
- **Go** (`go`)
- **Rust** (`rustc`, `cargo`)
- **Node.js & npm** (`node`, `npm`) - required by JavaScript/TypeScript/HTML/CSS language servers.

### Arch Linux Quick Installation
```bash
sudo pacman -S python go rust nodejs npm
```

---

## Optional CLI Integrations

- **lazygit**: TUI Git interface (`<leader>gg`)
- **delve** (`dlv`): Go debugger (`nvim-dap`)
- **codelldb**: C/C++/Rust debugger adapter (`nvim-dap`)
- **shellcheck**: Shell script linter (`nvim-lint`)
- **shfmt**: Shell script formatter (`conform.nvim`)
- **stylua**: Lua formatter (`conform.nvim`)

### Arch Linux Quick Installation
```bash
sudo pacman -S lazygit shellcheck shfmt stylua
```
