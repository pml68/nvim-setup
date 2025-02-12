local capabilities = vim.tbl_deep_extend("force",
  vim.lsp.protocol.make_client_capabilities(),
  require('cmp_nvim_lsp').default_capabilities()
)
local lspconfig = require("lspconfig")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local servers = {
  -- "asm_lsp",
  "html",
  "ts_ls",
  "cssls",
  "svelte",
  "bashls",
  "clangd",
  "pyright",
  "emmet_language_server",
  "jsonls",
  "rust_analyzer",
  "kotlin_language_server",
  "lua_ls",
  "glsl_analyzer",
  "csharp_ls",
  "gopls",
  "unocss",
}

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "build.sh", "*.subpackage.sh", "PKGBUILD", "*.install",
    "makepkg.conf", "*.ebuild", "*.eclass", "color.map", "make.conf" },
  callback = function()
    vim.lsp.start({
      name = "termux",
      cmd = { "termux-language-server" }
    })
  end,
})

for _, server in pairs(servers) do
  local opts = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
    end
  }

  local require_ok, conf_opts = pcall(require, "pml68.configs.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", opts, conf_opts)
  end

  lspconfig[server].setup(opts)
end
