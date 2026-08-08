-- Terminal
-- Terminal management via snacks.nvim
-- snacks.nvim terminal is configured in ui.lua, keymaps defined here

return {
  {
    "folke/snacks.nvim",
    keys = {
      -- Terminal keymaps
      {
        "<C-/>",
        function()
          Snacks.terminal(nil, { win = { style = "float" } })
        end,
        desc = "Toggle floating terminal",
        mode = { "n", "t" },
      },
      {
        "<leader>th",
        function()
          Snacks.terminal(nil, {
            win = {
              style = "split",
              position = "bottom",
              height = 0.3,
            },
          })
        end,
        desc = "Horizontal terminal",
      },
      {
        "<leader>tv",
        function()
          Snacks.terminal(nil, {
            win = {
              style = "split",
              position = "right",
              width = 0.4,
            },
          })
        end,
        desc = "Vertical terminal",
      },
      -- Lazygit (only if installed)
      {
        "<leader>gg",
        function()
          if vim.fn.executable("lazygit") == 1 then
            Snacks.lazygit()
          else
            vim.notify("lazygit is not installed", vim.log.levels.WARN)
          end
        end,
        desc = "Lazygit",
      },
    },
  },
}
