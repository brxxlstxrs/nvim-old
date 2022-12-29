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
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,

}

for k, v in pairs(options) do
  vim.opt[k] = v
end
