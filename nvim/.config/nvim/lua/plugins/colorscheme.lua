return {
	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = function(_, opts)
	-- 		opts.transparent = true
	-- 		opts.italic_comments = true
	-- 		opts.borderless_telescope = false
	-- 	end,
	-- },
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		name = "gruvbox-material",
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_transparent_background = 0
			vim.g.gruvbox_material_foreground = "original"
			vim.g.gruvbox_material_background = "soft"
			vim.g.gruvbox_material_ui_contrast = "low"
			vim.g.gruvbox_material_float_style = "bright"
			vim.g.gruvbox_material_statusline_style = "original"
			vim.g.gruvbox_material_cursor = "orange"
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_disable_terminal_colors = 1
			vim.g.gruvbox_material_lightline_disable_bold = 1

			-- vim.g.gruvbox_material_colors_override = { bg0 = '#16181A' } -- #0e1010
			-- vim.g.gruvbox_material_better_performance = 1

		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight",
		},
	},

	-- modicator (auto color line number based on vim mode)
	-- {
	-- 	"mawkler/modicator.nvim",
	-- 	dependencies = "scottmckendry/cyberdream.nvim",
	-- 	init = function()
	-- 		-- These are required for Modicator to work
	-- 		vim.o.cursorline = false
	-- 		vim.o.number = true
	-- 		vim.o.termguicolors = true
	-- 	end,
	-- 	opts = {},
	-- },
}
