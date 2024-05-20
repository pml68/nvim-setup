local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

local servers = {
  "asm_lsp",
  "html",
  "tsserver",
  "cssls",
  "svelte",
  "bashls",
  "clangd",
  "pyright",
  "emmet_ls",
  "jsonls",
  "rust_analyzer",
  "kotlin_language_server",
  "lua_ls",
  "glsl_analyzer"
}

for _, server in pairs(servers) do
  local opts = {
    capabilities = capabilities,
  }

  local require_ok, conf_opts = pcall(require, "pml68.configs.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
