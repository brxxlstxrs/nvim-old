local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local sources = {
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.formatting.black,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
    sources = sources
})
