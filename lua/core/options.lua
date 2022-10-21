local o = vim.o
-- Options

-- Editor options
o.number = true
o.relativenumber = true
o.cursorline = true
o.cursorlineopt = 'number'
o.colorcolumn = "81"
o.background = "dark"
o.termguicolors = true
-- o.signcolumn = "yes"
-- vim.o.wrap = false
-- o.mouse="a"
o.mousemodel = "extend"

o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

o.updatetime = 300
o.hidden = true
o.backup = false
o.writebackup = false
o.swapfile = false

-- completeopt
o.completeopt = "menuone,noselect"

-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- o.list = true
-- o.listchars:append("eol:↴")
