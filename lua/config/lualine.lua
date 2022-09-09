local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- lualine setup
lualine.setup({
	options = {
		theme = "gruvbox",
		-- theme = "catppuccin",
		-- theme = "gruvbox-material",
	},
})
