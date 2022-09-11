vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	styles = {
		comments = {}, -- { "italic" },
		conditionals = {}, -- { "italic" },
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = {}, -- { "italic" },
				hints = {}, -- { "italic" },
				warnings = {}, -- { "italic" },
				information = {}, -- { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		lsp_trouble = true,
		cmp = true,
		-- lsp_saga = false,
		gitsigns = true,
		telescope = true,
		nvimtree = true,
		dap = {
			enabled = true,
			enable_ui = true,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
	},
	custom_highlights = {
		-- Treesitter
		TSParameter = { style = {} },
		ErrorMsg = { style = {} },
	},
})

require("dap")

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

vim.cmd([[colorscheme catppuccin]])

-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_foreground = "mix"
-- vim.g.gruvbox_material_disable_italic_comment = 1
-- vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
-- vim.cmd([[colorscheme gruvbox-material]])

-- require("onedarkpro").setup({
-- 	dark_theme = "onedark",
-- 	plugins = {
-- 		treesitter,
-- 		native_lsp,
-- 		nvim_cmp,
-- 		nvim_tree,
-- 		nvim_dap,
-- 		nvim_dap_ui,
-- 		packer,
-- 		telescope,
-- 		trouble,
-- 		which_key,
-- 		tohggleterm,
-- 	},
-- })
-- vim.cmd("colorscheme onedarkpro")
