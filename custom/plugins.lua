local plugins = {
  -- LSP
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      ensure_installed = {
        "clang-format",
        "codelldb",
        "jq",
      }
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup()
      mason_lspconfig.setup({
        ensure_installed = {
          "html",
          "cssls",
          "tsserver",
          "emmet_ls",
          "gopls",
          "pyright",
          "clangd",
          "rust_analyzer",
          "svelte",
          "jsonls"
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    init = function()
      require("core.utils").load_mappings("cpp")
    end,
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = cmp_nvim_lsp.default_capabilities()

      lspconfig["html"].setup({
        capabilities = capabilities,
      })

      lspconfig["tsserver"].setup({
        capabilities = capabilities,
      })

      lspconfig["jsonls"].setup({
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })

      lspconfig["svelte"].setup({
        capabilities = capabilities,
      })

      lspconfig["cssls"].setup({
        capabilities = capabilities,
      })

      lspconfig["emmet_ls"].setup({
        capabilities = capabilities,
        filetypes = { "html", "typescript", "javascript", "css", "sass", "scss", "less" },
      })

      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig["gopls"].setup({
        capabilities = capabilities,
      })

      lspconfig["pyright"].setup({
        capabilities = capabilities,
        single_file_support = true,
      })

      lspconfig["clangd"].setup({
        capabilities = capabilities ,
        on_attach = function(client, bufnr)
          client.server_capabilities.signatureHelpProvider = false
        end,
      })

      lspconfig["rust_analyzer"].setup({
        capabilities = capabilities,
        filetypes = {"rust"},
        settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
      })
    end,
  },
  -- Misc
  {
    "andweeb/presence.nvim",
    lazy = false,
    opts = {
      main_image = "file",
      log_level = "debug",
    },
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"go", "cpp", "c", "json"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  -- Dap
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},      
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  -- JSON
  {
    "b0o/schemastore.nvim",
    ft = "json",
  },
  -- Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  -- Go
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
return plugins
