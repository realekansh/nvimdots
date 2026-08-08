-- Finder
-- fzf-lua for fuzzy finding (files, grep, buffers, LSP symbols, etc.)

return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    cmd = "FzfLua",
    keys = {
      -- Files
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
      { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep word under cursor" },
      { "<leader>f/", "<cmd>FzfLua grep_curbuf<cr>", desc = "Search current buffer" },

      -- LSP
      { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document symbols" },
      { "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
      { "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document diagnostics" },
      { "<leader>fD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace diagnostics" },

      -- Git
      { "<leader>fG", "<cmd>FzfLua git_files<cr>", desc = "Git files" },
      { "<leader>fc", "<cmd>FzfLua git_commits<cr>", desc = "Git commits" },

      -- Misc
      { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Help tags" },
      { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
      { "<leader>fC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
      { "<leader>fR", "<cmd>FzfLua resume<cr>", desc = "Resume last picker" },
      { "<leader><leader>", "<cmd>FzfLua buffers<cr>", desc = "Switch buffer" },
    },
    opts = {
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        border = "rounded",
        preview = {
          default = "builtin",
          border = "rounded",
          layout = "flex",
          flip_columns = 120,
          scrollbar = "float",
        },
      },
      fzf_opts = {
        ["--layout"] = "reverse",
      },
      fzf_colors = true,
      defaults = {
        file_icons = true,
        git_icons = true,
        formatter = "path.filename_first",
      },
      files = {
        fd_opts = "--color=never --type f --hidden --follow --exclude .git",
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096",
      },
      keymap = {
        builtin = {
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
        },
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
    },
    config = function(_, opts)
      local fzf = require("fzf-lua")
      fzf.setup(opts)
      fzf.register_ui_select()
    end,
  },
}
