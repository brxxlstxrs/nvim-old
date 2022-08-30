local status, telescope = pcall(require, "telescope")
if not status then
  return
end

telescope.setup {
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')

-- File browser
telescope.load_extension "file_browser"


vim.keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
vim.keymap.set("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
vim.keymap.set("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>")
vim.keymap.set("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>")

-- File browser
vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })
