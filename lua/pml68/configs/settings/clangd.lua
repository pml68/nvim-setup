return {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
  end
}
