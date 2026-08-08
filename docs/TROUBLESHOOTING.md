# Troubleshooting Guide

## Diagnostic Commands

Run these built-in Neovim commands to diagnose environment or plugin issues:

```vim
:checkhealth             " Run all system health checks
:checkhealth vim.lsp     " Verify LSP client and active server status
:checkhealth lazy        " Verify lazy.nvim state and lockfile
:checkhealth snacks      " Verify snacks.nvim active modules
:LspInfo                 " Check LSP server attached to current buffer
:ConformInfo             " Check formatters configured for active buffer
:Lazy                    " Open plugin manager interface
:Mason                   " Open Mason language server & tool manager
```

---

## Common Issues & Solutions

### 1. LSP Server Fails to Attach
- Check `:LspInfo` inside a buffer to see if a language server is registered.
- Open `:Mason` and ensure the server (e.g. `pyright`, `lua_ls`, `gopls`) is installed.
- Ensure the runtime for the language server (e.g. `node` for pyright/vtsls) is in your `$PATH`.

### 2. Formatter Not Working / Autoformat Failed
- Check `:ConformInfo` to verify configured formatters.
- Toggle format-on-save using `:FormatToggle`.
- Run manual formatting with `<leader>cf` to see error messages.

### 3. Missing Icons in File Explorer or Statusline
- Ensure Kitty terminal is configured to use a Nerd Font (e.g., `JetBrainsMono Nerd Font` or `FiraCode Nerd Font`).
- `mini.icons` is built-in and active; no extra devicon setup is needed.

### 4. Highlighting Missing or Incomplete
- Check if Treesitter is active for the current buffer:
  ```vim
  :lua print(vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()])
  ```
- Run `:TSUpdate` or `:TSInstall <language>` to compile the parser.

### 5. Lazygit or Debugger Command Fails
- Verify that `lazygit` is installed on your system (`command -v lazygit`).
- For Go debugging, ensure `dlv` is installed (`go install github.com/go-delve/delve/cmd/dlv@latest`).
- Missing external tools cause a non-blocking notification warning instead of crashing Neovim.
