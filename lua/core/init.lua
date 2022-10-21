g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- leader
g.mapleader = ","
g.python3_host_prog = "/usr/bin/python"

require("core.options")
require("core.autocmds")
