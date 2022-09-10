local present, dap = pcall(require, "dap")
if not present then
	return
end

require("dapui").setup()

require("nvim-dap-virtual-text").setup()

require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

-- Keymaps
local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>")
-- vim.keymap.set("n", "<leader>c", ":lua require('dap').continue()<CR>")
-- vim.keymap.set("n", "<leader>o", ":lua require('dapui').toggle()<CR>")

vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
vim.keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
vim.keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
vim.keymap.set("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.keymap.set(
	"n",
	"<Leader>B",
	"<Cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	opts
)
