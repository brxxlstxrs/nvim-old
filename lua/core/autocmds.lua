vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4",
})
