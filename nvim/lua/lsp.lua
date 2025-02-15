-- Configurar LSP
local lspconfig = require("lspconfig")

-- Servidor de lenguaje para Python (puedes añadir más)
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})

-- Configurar nvim-cmp para autocompletado
local cmp = require("cmp")
cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  }
})
