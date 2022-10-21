local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- TreeSitter
ts.setup {
	-- A list of parser names, or "all"
	ensure_installed = {
    "python", "lua", "cpp", "typescript", "css", "tsx"
  },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
}

