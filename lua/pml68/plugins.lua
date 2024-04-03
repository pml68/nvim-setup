local plugins = {
	-- Colorizer
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
	-- Indent Blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end
	},
  -- CMP
	{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
		dependencies = {
			{
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
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
			"hrsh7th/cmp-path"
    },
    config = function()
      require("pml68.configs.cmp")
    end,
  },
	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
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
  -- Undotree
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
  -- Git
  {
    "tpope/vim-fugitive",
    event = "BufReadPre"
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
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
  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "pml68.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = {"Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate"},
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

      vim.g.mason_binaries_list = opts.ensure_installed
    end
  },
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("pml68.configs.telescope")
    end
  },
  -- Color scheme
  {
    "drewtempelmeyer/palenight.vim",
    config = function()
      vim.cmd("colorscheme palenight")
    end
  },
  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = {"BufReadPost", "BufNewFile"},
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
					"c",
					"cpp",
					"lua",
					"kotlin",
					"nasm",
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
				},
				highlight = {
					enable = true
				}
      })
    end
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
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
	font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
	theme = "Palenight",
	background = "#1e1e2e",
	window_title = function()
	  return vim.fn.fnamemodify(
	    vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t"
	  )
	end
      })
    end
  },
  -- Formatting
  {
    "nvimdev/guard.nvim",
    dependencies = {
      "nvimdev/guard-collection"
    },
    event = "BufReadPre",
    config = function ()
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
  -- Dap
  {
    "mfussenegger/nvim-dap",
		init = function()
			require("pml68.configs.dap")
		end
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
    dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		},
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
  -- Dart/Flutter
  {
    "akinsho/flutter-tools.nvim",
		ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
  },
  -- PKL
  {
    "https://github.com/apple/pkl-neovim",
    lazy = true,
    event = "BufReadPre *.pkl",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    build = function()
      vim.cmd("TSInstall! pkl")
    end
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
	{
		"saecki/crates.nvim",
		tag = "stable",
		dependencies = "hrsh7th/nvim-cmp",
		event = {"BufRead Cargo.toml"},
		config = function()
			local crates = require("crates")
			crates.setup()

			vim.keymap.set("n", "<leader>rcu", function()
				crates.upgrade_all_crates()
			end)
		end
	},
}

return plugins
