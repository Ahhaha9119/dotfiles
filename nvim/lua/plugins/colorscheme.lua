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
		lazy = true,
		priority = 1000, -- make sure to load this before all the other plugins
		opts = {
			transparent = true,
		},
	},

	{
		"LazyVim/LazyVim",

		opts = {
			colorscheme = "vague",
		},
	},
}
