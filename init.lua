-- init.lua
-- Neovim 0.12.x configuration entry point

-- Set leader key before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable unused built-in plugins for performance
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_tutor_mode_plugin = 1

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.diagnostics")
require("config.commands")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
    }, true, {})
    return
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
  },
  rocks = {
    enabled = false,
  },
  install = {
    colorscheme = { "kanagawa", "habamax" },
  },
  checker = {
    enabled = false, -- Don't auto-check for updates
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
  },
})

-- Check system dependencies on first load
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  once = true,
  callback = function()
    require("utils.system").check_deps()
  end,
})
