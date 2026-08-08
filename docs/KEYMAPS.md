# Keymaps Reference

Leader Key: `<Space>`
Local Leader Key: `<Space>`

## Core & Movement

| Mode | Mapping | Action |
|---|---|---|
| Insert | `jk` | Exit insert mode |
| Normal | `<Esc>` | Clear search highlight |
| Normal | `j` / `k` | Smooth movement through wrapped lines |
| Normal | `<C-d>` / `<C-u>` | Half-page scroll (centered) |
| Normal | `n` / `N` | Next/Prev search result (centered) |
| Visual | `J` / `K` | Move selected lines down/up |
| Visual | `<` / `>` | Indent left/right (retains visual selection) |
| Visual | `p` | Paste over selection without clobbering paste register |
| Normal | `<C-s>` / `<leader>ww` | Save file |
| Normal | `<leader>wq` | Quit Neovim |

## Window & Buffer Navigation

| Mode | Mapping | Action |
|---|---|---|
| Normal | `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Move to left / down / up / right window |
| Normal | `<C-Up>` / `<C-Down>` | Resize window height (+2 / -2) |
| Normal | `<C-Left>` / `<C-Right>` | Resize window width (-2 / +2) |
| Normal | `<S-h>` / `<S-l>` | Switch to previous / next buffer |
| Normal | `<leader>bd` | Delete current buffer |
| Normal | `-` / `<leader>o` | Open parent directory in `oil.nvim` buffer |

## Fuzzy Search & Discovery (`fzf-lua`)

| Mapping | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep project |
| `<leader>fb` / `<leader><leader>` | List & switch open buffers |
| `<leader>fr` | Recent files |
| `<leader>fw` | Grep word under cursor |
| `<leader>f/` | Search lines in current buffer |
| `<leader>fs` | Document LSP symbols |
| `<leader>fS` | Workspace LSP symbols |
| `<leader>fd` | Document diagnostics |
| `<leader>fD` | Workspace diagnostics |
| `<leader>fG` | Git files |
| `<leader>fc` | Git commits |
| `<leader>fh` | Help tags |
| `<leader>fk` | Keymaps list |
| `<leader>fC` | User commands |
| `<leader>fR` | Resume last picker |
| `<leader>ft` | Find TODOs / FIXMEs |

## LSP Integration

| Mode | Mapping | Action |
|---|---|---|
| Normal | `gd` | Go to definition |
| Normal | `gD` | Go to declaration |
| Normal | `gi` | Go to implementation |
| Normal | `gr` | Show references |
| Normal | `gy` | Go to type definition |
| Normal | `K` | Show hover documentation |
| Normal/Insert | `<C-k>` | Show signature help |
| Normal | `<leader>ca` | Code actions |
| Normal | `<leader>cr` | Rename symbol |
| Normal | `<leader>ws` | Workspace symbols search |
| Normal | `[d` / `]d` | Jump to previous / next diagnostic |
| Normal | `<leader>e` | Open diagnostic floating window |
| Normal | `<leader>q` | Send diagnostics to location list |

## Formatting & Code Quality

| Mapping | Action |
|---|---|
| `<leader>cf` | Format current buffer (`conform.nvim`) |
| `<leader>cl` | Trigger manual linter run (`nvim-lint`) |
| `:FormatToggle` | Toggle format-on-save globally |
| `:DiagnosticsToggle` | Toggle LSP diagnostic virtual text |
| `:InlayHintsToggle` | Toggle LSP inlay hints |

## Git Operations (`gitsigns.nvim`)

| Mapping | Action |
|---|---|
| `]h` / `[h` | Jump to next / previous Git hunk |
| `<leader>gs` | Stage hunk (Normal / Visual selection) |
| `<leader>gr` | Reset hunk (Normal / Visual selection) |
| `<leader>gS` | Stage entire buffer |
| `<leader>gu` | Undo stage hunk |
| `<leader>gR` | Reset entire buffer |
| `<leader>gp` | Preview hunk inline |
| `<leader>gb` | Blame line (full hover details) |
| `<leader>gd` | Diff current buffer against index |
| `<leader>gt` | Toggle virtual line blame |
| `<leader>gg` | Open LazyGit float (if installed) |

## Terminal (`snacks.terminal`)

| Mode | Mapping | Action |
|---|---|---|
| Normal/Term | `<C-/>` | Toggle floating terminal |
| Normal | `<leader>th` | Toggle horizontal split terminal (bottom 30%) |
| Normal | `<leader>tv` | Toggle vertical split terminal (right 40%) |

## Debugging (`nvim-dap`)

| Mapping | Action |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Set conditional breakpoint |
| `<leader>dc` | Continue / Start debugging session |
| `<leader>dC` | Run to cursor |
| `<leader>do` | Step over |
| `<leader>di` | Step into |
| `<leader>dO` | Step out |
| `<leader>dr` | Toggle REPL window |
| `<leader>dl` | Run last debug session |
| `<leader>dt` | Terminate session |
| `<leader>du` | Toggle DAP UI layout |
