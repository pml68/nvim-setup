local plugins = {
  --Colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
      require("colorizer").setup()

      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end
  },
  --IndentBlankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    config = function()
      require("ibl").setup()
    end
  },
  --CMP
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets"
      },
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path"
    },
    config = function()
      require("pml68.configs.cmp")
    end,
  },
  --Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    opts = {
      shade_terminals = false,
      persist_size = false,
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    },
    config = function(_, opts)
      require("pml68.configs.toggleterm")
      require("toggleterm").setup(opts)
    end
  },
  --Undotree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
  --Git
  {
    "tpope/vim-fugitive",
    event = "BufReadPre"
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "<leader>gb", gs.blame_line)
      end,
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end
  },
  --LSP
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    config = function()
      require("pml68.configs.lspconfig")
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require("pml68.configs.mason")
    end,
    config = function(_, opts)
      require("mason").setup(opts)
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})
    end,
    build = ":MasonInstallAll",
  },
  --Fuzzyfinder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
  },
  --Colorscheme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
          italic = false,
        }
      })
      vim.cmd("colorscheme rose-pine")
    end
  },
  --Syntaxhighlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "asm",
          "c",
          "cpp",
          "lua",
          "kotlin",
          "bash",
          "html",
          "scss",
          "css",
          "typescript",
          "javascript",
          "svelte",
          "python",
          "rust",
          "markdown",
          "json",
          "glsl",
          "dart",
          "make",
          "gitignore",
          "gitattributes",
          "gitcommit",
        },
        highlight = {
          enable = true
        }
      })
    end
  },
  --Misc
  {
    "andweeb/presence.nvim",
    event = "BufReadPost",
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
    "NStefan002/screenkey.nvim",
    cmd = "Screenkey",
    version = "*",
    config = true
  },
  --Formatting
  {
    "nvimdev/guard.nvim",
    dependencies = {
      "nvimdev/guard-collection"
    },
    event = "BufReadPre",
    config = function()
      local ft = require("guard.filetype")

      ft("c,cpp,h"):fmt("clang-format")
      ft("json"):fmt({
        cmd = "jq",
        stdin = true
      })

      require("guard").setup({
        fmt_on_save = true,
        lsp_as_default_formatter = false
      })
    end
  },
  --Dart/Flutter
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
  },
  --PKL
  {
    "https://github.com/apple/pkl-neovim",
    event = "BufReadPre *.pkl",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    build = function()
      vim.cmd("TSInstall! pkl")
    end
  },
  -- Helium
  {
    "pml68/helium-neovim",
    event = "BufReadPre *.hsm",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    build = function()
      vim.cmd("TSInstall! helium")
    end
  },
  --JSON
  {
    "b0o/schemastore.nvim",
    ft = "json",
  },
  --Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    dependencies = "hrsh7th/nvim-cmp",
    event = { "BufRead Cargo.toml" },
    config = function()
      local crates = require("crates")
      crates.setup()

      vim.keymap.set("n", "<leader>rcu", function()
        crates.upgrade_all_crates()
      end)
    end
  },
  --LaTeX
  {
    "lervag/vimtex",
    dependencies = "micangl/cmp-vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'mupdf'
    end
  },
}

return plugins
