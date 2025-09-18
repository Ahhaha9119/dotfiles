return {
	-- add gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			transparent_mode = true,
		},
	},

	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			style = "moon",
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
		"rebelot/kanagawa.nvim",
		opts = {
			transparent = true,
			style = "dragon",
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
		"vague2k/vague.nvim",
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				-- optional configuration here
				transparent = true,
			})
			vim.cmd("colorscheme vague")
		end,
	},

	{
		"LazyVim/LazyVim",
		lazy = true,
		opts = {
			colorscheme = "vague",
		},
	},
}
