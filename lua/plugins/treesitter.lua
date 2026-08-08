-- Treesitter
-- Syntax highlighting, parser management, and code understanding
-- NOTE: Neovim 0.12.x uses the rewritten nvim-treesitter (main branch).
-- The old module system (highlight.enable, etc.) no longer exists.
-- Features are now enabled via Neovim native APIs.

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- Install parsers for supported languages
      require("nvim-treesitter").install({
        "lua", "vim", "vimdoc", "query", "regex",
        "python", "bash",
        "rust", "go", "gomod", "gosum",
        "c", "cpp",
        "javascript", "typescript", "tsx", "jsdoc",
        "html", "css",
        "json", "yaml", "toml",
        "markdown", "markdown_inline",
        "diff", "gitcommit", "git_rebase",
        "dockerfile", "make", "cmake",
        "fish",
      })

      -- Enable treesitter features via FileType autocmd
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
        callback = function(args)
          -- Try to start treesitter highlighting for this buffer
          local ok = pcall(vim.treesitter.start, args.buf)
          if ok then
            -- Enable treesitter indentation
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
