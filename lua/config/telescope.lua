local status, telescope = pcall(require, "telescope")
if not status then
  return
end

telescope.setup {
  extensions = {
    file_browser = {
      -- theme = "dropdown",
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

-- telescope.load_extension('fzf')

-- File browser
telescope.load_extension "file_browser"


vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers()<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags()<CR>")

-- File browser
vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })
