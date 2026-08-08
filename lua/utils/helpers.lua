-- Helpers
-- Utility functions used across the configuration

local M = {}

--- Check if an executable exists on the system
---@param cmd string
---@return boolean
function M.has_exec(cmd)
  return vim.fn.executable(cmd) == 1
end

--- Protected require with optional error notification
---@param module string
---@return any|nil
function M.prequire(module)
  local ok, result = pcall(require, module)
  if ok then
    return result
  end
  return nil
end

--- Create an augroup with clear
---@param name string
---@return integer
function M.augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

--- Get project root based on common markers
---@return string
function M.get_root()
  local markers = {
    ".git", "pyproject.toml", "package.json", "Cargo.toml",
    "go.mod", "Makefile", "CMakeLists.txt", ".editorconfig",
  }
  local root = vim.fs.root(0, markers)
  return root or vim.fn.getcwd()
end

return M
