-- Autocmds
-- Safe, well-guarded automatic commands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--- Check if buffer is a real writable file
local function is_real_file(buf)
  buf = buf or 0
  local buftype = vim.bo[buf].buftype
  local bufname = vim.api.nvim_buf_get_name(buf)
  if buftype ~= "" then return false end
  if bufname == "" then return false end
  if vim.bo[buf].readonly then return false end
  return true
end

-- Highlight yanked text
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.hl.on_yank({ timeout = 200 })
  end,
})

-- Restore cursor position
augroup("RestoreCursor", { clear = true })
autocmd("BufReadPost", {
  group = "RestoreCursor",
  callback = function(args)
    if not is_real_file(args.buf) then return end
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Remove trailing whitespace on save (skip markdown and diff)
augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  group = "TrimWhitespace",
  callback = function(args)
    if not is_real_file(args.buf) then return end
    local ft = vim.bo[args.buf].filetype
    if ft == "diff" or ft == "markdown" then return end
    local save_cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    pcall(vim.api.nvim_win_set_cursor, 0, save_cursor)
  end,
})

-- Create parent directories on save
augroup("MkdirOnSave", { clear = true })
autocmd("BufWritePre", {
  group = "MkdirOnSave",
  callback = function(args)
    if not is_real_file(args.buf) then return end
    local dir = vim.fn.fnamemodify(args.file, ":p:h")
    if dir and vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Check for external file changes
augroup("Checktime", { clear = true })
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = "Checktime",
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Resize splits on window resize
augroup("ResizeSplits", { clear = true })
autocmd("VimResized", {
  group = "ResizeSplits",
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Close certain filetypes with q
augroup("CloseWithQ", { clear = true })
autocmd("FileType", {
  group = "CloseWithQ",
  pattern = { "help", "man", "qf", "checkhealth", "lspinfo", "notify", "query" },
  callback = function(args)
    vim.bo[args.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = args.buf, silent = true })
  end,
})

-- Wrap and spell in text filetypes
augroup("TextSettings", { clear = true })
autocmd("FileType", {
  group = "TextSettings",
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})

-- Terminal settings
augroup("TerminalSettings", { clear = true })
autocmd("TermOpen", {
  group = "TerminalSettings",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.statuscolumn = ""
    vim.cmd("startinsert")
  end,
})
