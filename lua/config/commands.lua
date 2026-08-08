-- Commands
-- User-defined commands

-- Toggle diagnostics
local diagnostics_enabled = true
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
  diagnostics_enabled = not diagnostics_enabled
  vim.diagnostic.enable(diagnostics_enabled)
  vim.notify("Diagnostics " .. (diagnostics_enabled and "enabled" or "disabled"))
end, { desc = "Toggle diagnostics" })

-- Toggle inlay hints
vim.api.nvim_create_user_command("InlayHintsToggle", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  vim.notify("Inlay hints " .. (vim.lsp.inlay_hint.is_enabled() and "enabled" or "disabled"))
end, { desc = "Toggle inlay hints" })
