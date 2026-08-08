-- System
-- System detection and external dependency checking

local M = {}

local helpers = require("utils.helpers")

--- System dependency status
M.deps = {
  git = helpers.has_exec("git"),
  curl = helpers.has_exec("curl"),
  fd = helpers.has_exec("fd"),
  rg = helpers.has_exec("rg"),
  fzf = helpers.has_exec("fzf"),
  bat = helpers.has_exec("bat"),
  node = helpers.has_exec("node"),
  npm = helpers.has_exec("npm"),
  python = helpers.has_exec("python3") or helpers.has_exec("python"),
  go = helpers.has_exec("go"),
  cargo = helpers.has_exec("cargo"),
  rustc = helpers.has_exec("rustc"),
  gcc = helpers.has_exec("gcc"),
  make = helpers.has_exec("make"),
  lazygit = helpers.has_exec("lazygit"),
  tree_sitter_cli = helpers.has_exec("tree-sitter"),
}

--- Check required dependencies and warn about missing ones
function M.check_deps()
  local required = { "git", "curl" }
  local missing = {}
  for _, dep in ipairs(required) do
    if not M.deps[dep] then
      table.insert(missing, dep)
    end
  end
  if #missing > 0 then
    vim.notify(
      "Missing required dependencies: " .. table.concat(missing, ", "),
      vim.log.levels.ERROR
    )
  end
end

return M
