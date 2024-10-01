local plugins = {
  -- Visual surround
  {
    "NStefan002/visual-surround.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  -- tmux integration
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- Oil.nvim
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    config = function()
      require("oil").setup({
        keymaps = {
          ["<C-h>"] = false,
        },
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == '.git'
          end
        },
        float = {
          padding = 2,
          max_width = 50,
          max_height = 0,
          border = "single",
          win_options = {
            winblend = 0,
          },
        },
        skip_confirm_for_simple_edits = true,
        default_file_explorer = true,
      })
    end
  },
  --Color highlighting
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-highlight-colors").setup({
        render = 'virtual',
        enable_tailwind = true,
      })
    end
  },
  --IndentBlankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
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
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji"
    },
    config = function()
      require("pml68.configs.cmp")
    end,
  },
  --Git
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
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

          vim.keymap.set("n", "<leader>gb", gs.blame_line, { buffer = bufnr })
        end,
      })
    end
  },
  --LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
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
        },
        highlight_groups = {
          StatusLine = { fg = "iris", bg = "iris", blend = 10 },
          StatusLineNC = { fg = "subtle", bg = "surface" },
        },
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
          "c_sharp",
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
          "markdown_inline",
          "yaml",
          "json",
          "glsl",
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
    event = { "BufReadPost", "BufNewFile" },
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
    ft = { "c", "cpp", "json", "lua", "python", "cs" },
    config = function()
      local ft = require("guard.filetype")

      ft("c,cpp,h"):fmt("clang-format")
      ft("json"):fmt({
        cmd = "jq",
        stdin = true
      })

      require("guard").setup({
        fmt_on_save = true,
        lsp_as_default_formatter = true
      })
    end
  },
  --PKL
  {
    "apple/pkl-neovim",
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
    ft = "tex",
    init = function()
      vim.g.vimtex_view_method = 'mupdf'
    end
  },
}

return plugins
