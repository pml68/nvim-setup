local cmp = require("cmp")

cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'vimtex' },
    { name = 'crates' },
    { name = 'emoji' },
  }, {
    { name = 'buffer' },
  }),
  window = {
    completion = {
      border = "rounded",
      scrollbar = false,
    }
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
  }),
})
