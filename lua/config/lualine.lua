local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
	theme = "onenord",
    -- theme = "gruvbox"
    --
  -- component_separators = { left = '', right = '' },
  -- section_separators = { left = '', right = '' },
  },
})
