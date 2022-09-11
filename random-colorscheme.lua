-- Create and apply randomly generated Base16 color scheme
--
-- Prerequisites:
-- - Install 'mini.nvim' (https://github.com/echasnovski/mini.nvim).
-- - Put code inside a Lua file (like '~/.config/nvim/random-colorscheme.lua').
-- - Source that file. Either with `:source <file path>` or with
--   `require('<module name>')` (if put inside 'lua' subdirectory of your
--   config; won't work more than once due to caching).

-- General idea:
-- - Randomly generate background and foreground colors based on specified
--   ranges for red, green, and blue colors.
-- - Randomly generate accent chroma (saturation level) from specified range.
-- - Generate Base16 palette with `mini_palette()` function of 'mini.base16'.
--   It ensures that all other colors besides background and foreground are as
--   distinguishable from one another as possible.
-- - Save it to `_G.palette` for future reference. NOTE: you can use
--   `require('mini.misc').put_text(_G.palette)` to place palette inside
--   current buffer.
-- - Apply palette.

local random_color = function(red_range, green_range, blue_range)
  local rgb = {
    r = math.random(red_range[1], red_range[2]),
    g = math.random(green_range[1], green_range[2]),
    b = math.random(blue_range[1], blue_range[2]),
  }
	return string.format('#%02x%02x%02x', rgb.r, rgb.g, rgb.b)
end

math.randomseed(os.time())
local background = random_color({ 0, 63 }, { 0, 63 }, { 0, 63 })
local foreground = random_color({ 240, 255 }, { 240, 255 }, { 240, 255 })
local accent_chroma = math.random(40, 80)

local base16 = require('mini.base16')
_G.palette = base16.mini_palette(background, foreground, accent_chroma)
base16.setup({ palette = _G.palette })