local status, nvim_tree = pcall(require, "nvim_tree")
if not status then
  return
end

nvim_tree.setup()

-- Keymaps
vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', ':NvimTreeFindFile<CR>')

