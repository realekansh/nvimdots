-- Completion
-- blink.cmp v2 with native vim.snippet engine

return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "saghen/blink.lib",
      "rafamadriz/friendly-snippets",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    build = function()
      require("blink.cmp").build():pwait()
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
        menu = {
          border = "rounded",
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
          },
        },
        ghost_text = {
          enabled = false, -- Can be distracting during active coding
        },
      },

      snippets = {
        preset = "default", -- Uses native vim.snippet engine
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      cmdline = {
        keymap = { preset = "inherit" },
      },
    },
  },
}
