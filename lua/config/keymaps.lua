-- Keymaps
-- Core keymaps independent of plugins

local map = vim.keymap.set

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better escape
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Better movement on wrapped lines
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down (wrapped)" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up (wrapped)" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Window resize
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Move lines in visual mode
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move lines down", silent = true })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move lines up", silent = true })

-- Better indenting (stay in visual mode)
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Diagnostic navigation
map("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })
map("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
map("n", "<leader>e", function() vim.diagnostic.open_float() end, { desc = "Show diagnostic" })
map("n", "<leader>q", function() vim.diagnostic.setloclist() end, { desc = "Diagnostics to loclist" })

-- Quickfix navigation
map("n", "[q", "<cmd>cprevious<cr>", { desc = "Previous quickfix" })
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix" })

-- Better paste (don't overwrite register in visual mode)
map("x", "p", '"_dP', { desc = "Paste without overwrite" })

-- Center screen after jumps
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
map("n", "n", "nzzzv", { desc = "Next search centered" })
map("n", "N", "Nzzzv", { desc = "Prev search centered" })

-- Save
map({ "n", "i", "v", "s" }, "<C-s>", "<cmd>w<cr><Esc>", { desc = "Save file" })

-- Quit shortcuts
map("n", "<leader>wq", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>ww", "<cmd>w<cr>", { desc = "Save" })
