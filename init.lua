local present, impatient = pcall(require, "impatient")
if not present then
  return
end
require("impatient")
require("core")
require("plugins")

-- Theme
local present2, catppuccin = pcall(require, "catppuccin")
if not present2 then
  return
end
require("colorscheme")
