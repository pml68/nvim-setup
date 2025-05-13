return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("pml68.configs.lspconfig")
    end
  },
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonUpdate", "MasonLog" },
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
}
