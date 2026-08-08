-- LSP
-- Language Server Protocol configuration
-- Uses Neovim 0.12 native vim.lsp.config/vim.lsp.enable with mason-lspconfig

return {
  -- Mason: external tool installer
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- mason-lspconfig: bridge between Mason and Neovim LSP
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "pyright",
        "lua_ls",
        "bashls",
        "rust_analyzer",
        "gopls",
        "clangd",
        "vtsls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "taplo",
        "marksman",
      },
      automatic_enable = true,
    },
  },

  -- nvim-lspconfig: community server definitions + configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Global capabilities from blink.cmp
      local has_blink, blink = pcall(require, "blink.cmp")
      if has_blink then
        vim.lsp.config("*", {
          capabilities = blink.get_lsp_capabilities(),
        })
      end

      -- Server-specific configurations
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
            hint = { enable = true },
          },
        },
      })

      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          },
        },
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            gofumpt = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              constantValues = true,
              parameterNames = true,
            },
          },
        },
      })

      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
        },
      })

      vim.lsp.config("vtsls", {
        settings = {
          typescript = {
            inlayHints = {
              parameterNames = { enabled = "all" },
              variableTypes = { enabled = true },
            },
          },
          javascript = {
            inlayHints = {
              parameterNames = { enabled = "all" },
              variableTypes = { enabled = true },
            },
          },
        },
      })

      vim.lsp.config("jsonls", {
        settings = {
          json = {
            validate = { enable = true },
          },
        },
      })

      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      })

      -- LspAttach keymaps and features
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local buf = args.buf
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = "LSP: " .. desc })
          end

          -- Navigation
          map("n", "gd", function() vim.lsp.buf.definition() end, "Go to definition")
          map("n", "gD", function() vim.lsp.buf.declaration() end, "Go to declaration")
          map("n", "gi", function() vim.lsp.buf.implementation() end, "Go to implementation")
          map("n", "gr", function() vim.lsp.buf.references() end, "References")
          map("n", "gy", function() vim.lsp.buf.type_definition() end, "Type definition")

          -- Information
          map("n", "K", function() vim.lsp.buf.hover() end, "Hover")
          map({ "n", "i" }, "<C-k>", function() vim.lsp.buf.signature_help() end, "Signature help")

          -- Actions
          map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, "Code action")
          map("n", "<leader>cr", function() vim.lsp.buf.rename() end, "Rename")

          -- Workspace
          map("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol("") end, "Workspace symbols")

          -- Inlay hints
          if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = buf })
          end

          -- Document highlight on cursor hold
          if client and client:supports_method("textDocument/documentHighlight") then
            local hl_group = vim.api.nvim_create_augroup("LspHighlight_" .. buf, { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              group = hl_group,
              buffer = buf,
              callback = function() vim.lsp.buf.document_highlight() end,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              group = hl_group,
              buffer = buf,
              callback = function() vim.lsp.buf.clear_references() end,
            })
          end
        end,
      })
    end,
  },
}
