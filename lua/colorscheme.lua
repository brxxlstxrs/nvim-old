-- local status, gruvbox = pcall(require, 'gruvbox') -- [[ onenord ]]
local status, onenord = pcall(require, 'onenord')
if not status then
  return
end

-- vim.opt.background = "light"

-- require("gruvbox").setup({
--     italic = false,
-- })
--
-- vim.cmd([[colorscheme gruvbox]])

onenord.setup()
