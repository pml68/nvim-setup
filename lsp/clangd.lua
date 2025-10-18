return {
  filetypes = { "c", "cpp", "h" },
  cmd = {
    vim.fn.stdpath('data') .. "/mason/bin/clangd",
    "--header-insertion=never"
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
  end,
}
