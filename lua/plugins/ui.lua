-- UI
-- Minimal, cohesive UI components

return {
  -- Kanagawa colorscheme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = true,
      commentStyle = { italic = true },
      keywordStyle = { italic = false },
      statementStyle = { bold = true },
      transparent = false,
      theme = "wave", -- wave, dragon, lotus
      background = {
        dark = "wave",
        light = "lotus",
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Rounded completion/float styling
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
          FloatBorder = { bg = "NONE" },
          NormalFloat = { bg = theme.ui.bg_m1 },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd.colorscheme("kanagawa")
    end,
  },

  -- snacks.nvim: unified UI utilities
  {
    "folke/snacks.nvim",
    priority = 999,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- Startup optimization
      bigfile = { enabled = true },
      quickfile = { enabled = true },

      -- Notifications
      notifier = {
        enabled = true,
        timeout = 3000,
        style = "compact",
      },

      -- Dashboard
      dashboard = {
        enabled = true,
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":FzfLua files" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":FzfLua live_grep" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":FzfLua oldfiles" },
            { icon = " ", key = "c", desc = "Config", action = ":FzfLua files cwd=" .. vim.fn.stdpath("config") },
            { icon = " ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "m", desc = "Mason", action = ":Mason" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup", icon = "" },
        },
      },

      -- Indent guides
      indent = {
        enabled = true,
        char = "│",
        only_scope = false,
        only_current = false,
        animate = { enabled = false },
      },

      -- Input UI
      input = { enabled = true },

      -- Scope
      scope = { enabled = true },

      -- Statuscolumn
      statuscolumn = { enabled = true },

      -- Words highlight (disabled: using LSP document_highlight instead)
      words = { enabled = false },
    },
    keys = {
      { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification history" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss notifications" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
    },
  },

  -- Lualine: statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "snacks_dashboard" },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
          { "filename", path = 1 },
          { "diagnostics" },
        },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "oil", "quickfix", "man", "lazy" },
    },
  },
}
