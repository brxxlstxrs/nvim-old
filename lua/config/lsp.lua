local status, lspconfig = pcall(require, "lspconfig")
if not status then
  return
end

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

vim.diagnostic.config({
  virtual_text = {
    -- prefix = '■', -- Could be '●', '▎', 'x'
    prefix = "●",
  },
})

vim.lsp.set_log_level("debug")

local mason, mason_lspconfig = require('mason'), require('mason-lspconfig')
mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "pyright" },
    automatic_installation = false,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = { "utf-16" }


local clangd_extensions = require('clangd_extensions')

clangd_extensions.setup({
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
})

servers = {
  "pyright",
  -- "ccls",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup{
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
