-- Markdown-specific settings
vim.opt_local.wrap = true
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"
vim.opt_local.conceallevel = 2
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

-- Markdown-specific keymaps
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>",
  { buffer = true, desc = "Toggle Markdown preview" })
