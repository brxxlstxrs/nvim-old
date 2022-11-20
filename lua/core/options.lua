local options = {
  number = true,
  relativenumber = true,
  cursorline = true,
  colorcolumn = "81",
  background = "dark",
  termguicolors = true,

  backup = false,
  writebackup = false,
  swapfile = false,
  updatetime = 100,
  completeopt = "menu,menuone,noselect",
  ignorecase = true,
  mousemodel = "extend",
  -- clipboard = "unnamed,unnamedplus",

  expandtab = true,
  shiftwidth = 4,
  tabstop = 4,
  softtabstop = 4,

}

for k, v in pairs(options) do
  vim.opt[k] = v
end
