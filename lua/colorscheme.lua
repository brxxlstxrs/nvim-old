-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
--
-- require("catppuccin").setup({
-- 	dim_inactive = {
-- 		enabled = false,
-- 		shade = "dark",
-- 		percentage = 0.15,
-- 	},
-- 	transparent_background = false,
-- 	term_colors = false,
-- 	compile = {
-- 		enabled = false,
-- 		path = vim.fn.stdpath("cache") .. "/catppuccin",
-- 	},
-- 	styles = {
-- 		comments = {}, -- { "italic" },
-- 		conditionals = {}, -- { "italic" },
-- 		loops = {},
-- 		functions = {},
-- 		keywords = {},
-- 		strings = {},
-- 		variables = {},
-- 		numbers = {},
-- 		booleans = {},
-- 		properties = {},
-- 		types = {},
-- 		operators = {},
-- 	},
-- 	integrations = {
-- 		treesitter = true,
-- 		native_lsp = {
-- 			enabled = true,
-- 			virtual_text = {
-- 				errors = {}, -- { "italic" },
-- 				hints = {}, -- { "italic" },
-- 				warnings = {}, -- { "italic" },
-- 				information = {}, -- { "italic" },
-- 			},
-- 			underlines = {
-- 				errors = { "underline" },
-- 				hints = { "underline" },
-- 				warnings = { "underline" },
-- 				information = { "underline" },
-- 			},
-- 		},
-- 		lsp_trouble = true,
-- 		cmp = true,
-- 		-- lsp_saga = false,
-- 		gitsigns = true,
-- 		telescope = true,
-- 		nvimtree = true,
-- 		dap = {
-- 			enabled = true,
-- 			enable_ui = true,
-- 		},
-- 		which_key = true,
-- 		indent_blankline = {
-- 			enabled = true,
-- 			colored_indent_levels = false,
-- 		},
-- 		-- dashboard = true,
-- 		-- bufferline = {
-- 		-- 	enabled = true,
-- 		-- 	italics = false,  -- true,
-- 		-- 	bolds = true,
-- 		-- },
-- 		-- markdown = true,
-- 		-- lightspeed = false,
-- 		-- ts_rainbow = false,
-- 		-- hop = false,
-- 		-- notify = true,
-- 		-- telekasten = true,
-- 		-- symbols_outline = true,
-- 		-- mini = false,
-- 		-- aerial = false,
-- 		-- vimwiki = true,
-- 		-- beacon = true,
-- 		-- navic = false,
-- 		-- overseer = false,
-- 	},
-- 	color_overrides = {},
-- 	highlight_overrides = {},
-- 	custom_highlights = {
-- 		-- Treesitter
-- 		TSParameter = { style = {} },
-- 		ErrorMsg = { style = {} },
-- 	},
-- })
--
-- require("dap")
--
-- local sign = vim.fn.sign_define
--
-- sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
-- sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
-- sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
--
-- vim.cmd([[colorscheme catppuccin]])

-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_foreground = "mix"
-- vim.g.gruvbox_material_disable_italic_comment = 1
-- vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
-- vim.cmd([[colorscheme gruvbox-material]])

require("onedarkpro").setup({
	plugins = {
		treesitter,
		native_lsp,
		nvim_cmp,
		nvim_tree,
		nvim_dap,
		nvim_dap_ui,
		packer,
		telescope,
		trouble,
		which_key,
		tohggleterm,
	},
})
vim.cmd("colorscheme onedarkpro")
