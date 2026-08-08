-- Options
-- Core editor settings for Neovim 0.12.x

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Cursor
opt.cursorline = true

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.breakindent = true -- Wrapped lines preserve indentation

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.signcolumn = "yes" -- Always show, avoids layout shift
opt.termguicolors = true
opt.showmode = false -- Statusline shows mode
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.pumheight = 10 -- Completion menu height
opt.pumblend = 0
opt.cmdheight = 1
opt.laststatus = 3 -- Global statusline
opt.fillchars = { eob = " ", fold = " ", foldopen = "▾", foldclose = "▸", foldsep = " " }
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Windows
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "screen" -- Keep text on screen when splitting

-- Files
opt.hidden = true
opt.confirm = true -- Confirm before closing unsaved
opt.autoread = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Undo / Backup
opt.undofile = true
opt.undolevels = 10000
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Performance
opt.updatetime = 250 -- Faster CursorHold events
opt.timeoutlen = 300 -- Faster key sequence completion
opt.ttimeoutlen = 10

-- Completion (native)
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append("c")

-- Clipboard
opt.clipboard = "unnamedplus"

-- Mouse
opt.mouse = "a"
opt.mousemodel = "extend"

-- Folding (Treesitter-based)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldtext = ""

-- Conceal
opt.conceallevel = 2

-- Grep (use ripgrep)
opt.grepprg = "rg --vimgrep --smart-case"
opt.grepformat = "%f:%l:%c:%m"
