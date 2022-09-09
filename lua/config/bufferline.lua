local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

-- Setup bufferline
bufferline.setup({
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
	},
	-- bufferline.setup({ highlights = require("catppuccin.groups.integrations.bufferline").get({
	-- 	styles = {},
	-- }) }),
})
