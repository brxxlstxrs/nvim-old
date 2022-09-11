local status, lualine = pcall(require, "lualine")
if not status then
	return
end
local palette = vim.fn["gruvbox_material#get_palette"]("medium", "mix", { [vim.type_idx] = vim.types.dictionary })

-- lualine setup
lualine.setup({
	options = {
		theme = "catppuccin",
		-- theme = "onedark",
		-- theme = "gruvbox-material",
		-- diagnostics_color = {
		-- 	hint = { fg = palette["green"][1] },
		-- 	info = { fg = palette["blue"][1] },
		-- 	warn = { fg = palette["yellow"][1] },
		-- 	error = { fg = palette["red"][1] },
		-- },
	},
})
