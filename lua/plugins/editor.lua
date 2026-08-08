-- Editor
-- Plugins that enhance core editing functionality

return {
  -- oil.nvim: file management as a buffer
  {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
      { "<leader>o", "<cmd>Oil<cr>", desc = "Oil file manager" },
    },
    cmd = "Oil",
    opts = {
      default_file_explorer = true,
      columns = {
        "icon",
        "permissions",
        "size",
      },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
      },
      float = {
        padding = 2,
        max_width = 120,
        max_height = 40,
        border = "rounded",
      },
    },
  },

  -- which-key: keymap discovery
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      delay = 300,
      icons = {
        rules = false,
        breadcrumb = "»",
        separator = "➜",
      },
      spec = {
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Code" },
        { "<leader>d", group = "Debug" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>t", group = "Toggle" },
        { "<leader>w", group = "Window/Write" },
      },
    },
  },

  -- todo-comments: highlight and search TODOs
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo" },
      { "<leader>ft", "<cmd>TodoFzfLua<cr>", desc = "Find TODOs" },
    },
  },

  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    },
  },

  -- surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  -- mini.icons for file icons
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {},
    init = function()
      -- Compatibility shim for plugins expecting nvim-web-devicons
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
}
