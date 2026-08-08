-- Linting
-- nvim-lint for external linters (complements LSP diagnostics)

return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Only configure linters that don't duplicate LSP diagnostics.
      -- Most languages get diagnostics from their LSP server.
      -- These linters add value beyond what the LSP provides.
      lint.linters_by_ft = {
        bash = { "shellcheck" },
        sh = { "shellcheck" },
        fish = { "fish" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          -- Only lint real file buffers
          if vim.bo.buftype == "" then
            lint.try_lint()
          end
        end,
      })

      vim.keymap.set("n", "<leader>cl", function()
        lint.try_lint()
      end, { desc = "Trigger linting" })
    end,
  },
}
