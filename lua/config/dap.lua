local present, dap = pcall(require, "dap")
if not present then
	return
end

require("dapui").setup()

require("nvim-dap-virtual-text").setup()

require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

-- Keymaps
vim.keymap.set("n", "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>c", ":lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>o", ":lua require('dapui').toggle()<CR>")
